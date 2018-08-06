<?php


//载入护航网络配置
function hh_conf($key,$default=''){

    static $config;

    if(!$config)
        $config = pc_base::load_config('content');

    if(!$config) return '<a href="http://huhangnet.com/" target="_blank">huhangnet.com</a>';

    return isset($config[$key]) ? $config[$key] : $default;
}


/**
 * 当前路径
 * 返回指定栏目路径层级
 * @param $catid 栏目id
 * @wrap    包裹标签
 * @param $symbol 栏目间隔符
 */
function hh_catpos($catid,$wrap='', $symbol='<span class="interval"> > </span>'){

    $crumbs = hh_conf('crumbs');

    $category_arr = array();
    $siteids = getcache('category_content','commons');
    $siteid = $siteids[$catid];
    $category_arr = getcache('category_content_'.$siteid,'commons');
    if(!isset($category_arr[$catid])) return '';
    $pos = '';
    $siteurl = siteurl($category_arr[$catid]['siteid']);
    $arrparentid = array_filter(explode(',', $category_arr[$catid]['arrparentid'].','.$catid));

    if($wrap){
        $wrap = array('<'.$wrap.'>','</'.$wrap.'>');
    }else{
        $wrap = array('','');
    }

    foreach($arrparentid as $catid) {

        if(in_array($catid,$crumbs['noshow'])){
            continue;
        }

        if(isset($crumbs['catlinks'][$catid])){
            if(is_numeric($crumbs['catlinks'][$catid])){
                $url = hh_check_cate_url(hh_categorys($crumbs['catlinks'][$catid]));
            }else if('__one__' == $crumbs['catlinks'][$catid]) {
                $url = hh_check_cate_url(hh_categorys($catid));
            }else{
                $url = $crumbs['catlinks'][$catid];
            }
        }else{
            $url = hh_check_cate_url($category_arr[$catid]);
        }
        if(strpos($url, '://') === false) $url = $siteurl.$url;
        $pos .= $wrap[0].'<a href="'.$url.'">'.$category_arr[$catid]['catname'].'</a>'.$wrap[1].$symbol;
    }

    return $symbol=='' ? $pos : substr($pos,0,strlen($symbol)*-1);
}


//得到所有显示的子栏目
function hh_subcat($pid=0, $all=false){

    $reData = array();

    $CATEGORYS = hh_categorys();

    if($pid){   //得到某个子栏目

        $CAT = hh_categorys($pid);

        if(!$CAT){
            return $reData;
        }

        $subcatids = explode(',', $CAT['arrchildid']);

        unset($subcatids[0]);

    }else{  //得到一级栏目

        $subcatids = array();

        foreach ($CATEGORYS as $cat){
            if($cat['pid'] == $pid){
                if(!$all && !$cat['ismenu']){
                    continue;
                }
                $subcatids[] = $cat['catid'];
            }
        }

    }



    foreach($subcatids as $cid){

        if(!isset($CATEGORYS[$cid]) || $CATEGORYS[$cid]['parentid'] != $pid){
            continue;
        }


        if(!$all && !$CATEGORYS[$cid]['ismenu']){
            continue;
        }

        $reData[$cid] = $CATEGORYS[$cid];

    }

    return $reData;

}


/*
 * 得到所有栏目
 */
function hh_categorys($catid=null){

    static $CATEGORYS=null;

    if(!$CATEGORYS){
        $CATEGORYS = getcache('category_content_'.hh_get_siteid(),'commons');
    }

    if(is_null($catid)) return $CATEGORYS;

    return isset($CATEGORYS[$catid]) ? $CATEGORYS[$catid] : null;

}


/**
 * 获取当前的站点ID
 */
function hh_get_siteid() {

    return 1;
}

/*
 * 得到栏目图片
 * 如果栏目没有设置图片则得到父栏目图片，依次类推
 */
function hh_catimg($catid,$recursive=true,$default='/statics/huhangnet/common/img/default_catimg.jpg'){

    $CATEGORYS = hh_categorys();

    $cate = isset($CATEGORYS[$catid]) ? $CATEGORYS[$catid] : null;

    if(!$cate) return $default;

    if(!$recursive || $cate['image']){
        return $cate['image'];
    }

    $parentids = array_reverse(explode(',',$cate['arrparentid']));

    foreach($parentids as $v){
        if($CATEGORYS[$v]['image']){
            return $CATEGORYS[$v]['image'];
        }
    }
    return $default;
}


/*
 * 得到单页栏目的真实链接
 * 用于有子栏目的单页栏目
 */
function hh_check_cate_url($cate,$one=false){

    if(($one || $cate['type']==1) && !is_numeric($cate['arrchildid'])){

        $_arr = explode(',',$cate['arrchildid']);

        return hh_check_cate_url(hh_categorys($_arr[1]),$one);

    }

    return defined('HH_MOBILE') ? hh_m_list_url($cate) : $cate['url'];

}


/*
 * 得到一个栏目的最顶级栏目id
 */
function hh_catpid($catid){

    $CATEGORYS = hh_categorys();

    $cate = isset($CATEGORYS[$catid]) ? $CATEGORYS[$catid] : null;

    if(!$cate || !$cate['arrparentid']) return $catid;


    return (int)substr($cate['arrparentid'],2);


}



/*
 * 得到单页信息
 */
function hh_page_content($catid,$field=null){

    $db = pc_base::load_model('page_model');

    $data = $db->get_one('catid='.$catid);

    if($field){
        return isset($data[$field]) ? $data[$field] : null;
    }

    return $data;

}


/**
 * 指定栏目id是否是CAT的子栏目
 */
function hh_in_cate($catid,$CAT){
    if($catid && $CAT){
        return in_array($catid,explode(',',$CAT['arrchildid']));
    }
    return false;

}


/**
 * @param $n
 * @param $num
 * @param bool $hasStyle
 * @return 指定行数后边的css
 */
function hh_mrnum($n,$num,$hasStyle=true){
    return !($n%$num) ? ($hasStyle ? ' style="margin-right:0;"' : 'margin-right:0;') : '';
}


/**
 * 得到手机站域名
 * @return null|string
 */
function hh_m_domain(){

    static $mDomain=null;

    if(is_null($mDomain)){
        $domain = hh_conf('mobile_domain_prefix');
        $app_path = APP_PATH;
        if($domain){
            $arr = explode('.',$app_path);
            $rArr = explode('//',$arr[0]);
            $rArr[1] = $domain;

            $app_path  = str_replace($arr[0],implode('//',$rArr),$app_path);

        }
        $mDomain = $app_path;

        if(!hh_conf('mobile_domain_prefix')){
            $mDomain .= trim(hh_conf('mobile_dir'),'/').'/';
        }

    }

    return $mDomain;

}


/*
 * 得到手机列表页模板
 */
function hh_m_list_url($CAT, $arg=array(), $type=null){

    $type = is_null($type) ? hh_conf('mobile_liks_type',0) : $type;

    switch ($type){

        case 0: //动态
            $url = hh_m_domain().'index.php?m=content&c=index&a=lists&catid='.$CAT['catid'];
            foreach ($arg as $k=>$v){
                if($k != '__a__'){
                    $url .= '&'.$k.'='.$v;
                }
            }
            break;

        case 1: //静态
            $url = str_replace(APP_PATH,hh_m_domain(),$CAT['url']);
            break;

        case 2: //伪静态
//             $url = hh_m_domain().'list-'.$CAT['catid'].'-1';
//             foreach ($arg as $k=>$v){
//                 if($k != '__a__'){
//                     $url .= '-'.$k.'_'.$v;
//                 }
//             }
//             $url .= '.html';
        	$url = str_replace(APP_PATH,hh_m_domain(),$CAT['url']);
            break;
    }

    if(isset($arg['__a__'])){
        $url .= '#'.$arg['__a__'];
    }

    return $url;

}


/**
 * @param $rs
 * @param array $arg 参数，仅动态链接支持，如果需要锚点支持请添加 __anchor__变量
 * @param null $type 0动态  1静态  2伪静态
 * @return mixed|string
 *
 */
function hh_m_show_url($rs, $arg=array(), $type=null){

    $type = is_null($type) ? hh_conf('mobile_liks_type',0) : $type;

    switch ($type){

        case 0: //动态
            $url = hh_m_domain().'index.php?m=content&c=index&a=show&catid='.$rs['catid'].'&id='.$rs['id'];
            foreach ($arg as $k=>$v){
                if($k != '__anchor__'){
                    $url .= '&'.$k.'='.$v;
                }
            }
            break;

        //静态和伪静态不支持任何参数
        case 1: //静态
        case 2: //伪静态
            $url = str_replace(APP_PATH,hh_m_domain(),$rs['url']);
            break;
    }

    if(isset($arg['__anchor__'])){
        $url .= '#'.$arg['__anchor__'];
    }

    return $url;

}


/**
 * @param $pages
 * @return mixed
 * 手机站页面替换效果
 */
function hh_m_pages($pages,$one=true){

    return str_replace(APP_PATH,'',hh_pages($pages,$one));
}


function hh_pages($pages,$one=true){
    $pageArr = explode('> <',$pages);
    if($one)
        unset($pageArr[0]);
    $rePages = '<'.trim(str_replace(array('上一页','下一页'),array('<','>'),implode('> <', $pageArr)),'<>').'>';
    return $rePages;
}


/*
 * 将phpcms分页转换为bootstrap分页
 */
function hh_page2strap($pages){

    if(!$pages) return '';

    $str = '<ul class="pagination">';
    $pages = explode('> <',str_replace(array('span>',' class="a1"'),array('a>',''),$pages));

    foreach($pages as $v){

        $class = is_numeric(trim($v,'></a')) ? ' active' : '';
        $str .= '<li class="paginate_button'.$class.'"><'.trim($v,'<>').'></li>';
    }

    $str .= '</ul>';

    return $str;

}


/**
 * 生成缩略图函数
 * @param  $imgurl 图片路径
 * @param  $width  缩略图宽度
 * @param  $height 缩略图高度
 * @param  $autocut 是否自动裁剪 默认裁剪，当高度或宽度有一个数值为0是，自动关闭
 * @param  $smallpic 无图片是默认图片路径
 */
function hh_thumb($imgurl, $width = 500, $height = 500 ,$autocut = 1, $smallpic = 'nopic.gif') {
    global $image;
    $upload_url = pc_base::load_config('system','upload_url');
    $upload_path = pc_base::load_config('system','upload_path');

    if(empty($imgurl)) return IMG_PATH.$smallpic;

    $upload = str_replace(PHPCMS_PATH,'/',$upload_path);

    $imgurl_replace= str_replace(array($upload_url,$upload), '', $imgurl);
    if(!extension_loaded('gd') || strpos($imgurl_replace, '://') || substr($imgurl_replace,0,1) == '/') return $imgurl;

    if(!file_exists($upload_path.$imgurl_replace)) return IMG_PATH.$smallpic;

    list($width_t, $height_t, $type, $attr) = getimagesize($upload_path.$imgurl_replace);
    if($width>=$width_t || $height>=$height_t) return $imgurl;

    $newimgurl = dirname($imgurl_replace).'/thumb_'.$width.'_'.$height.'_'.basename($imgurl_replace);

    if(file_exists($upload_path.$newimgurl)) return $upload_url.$newimgurl;

    if(!is_object($image)) {
        pc_base::load_sys_class('image','','0');
        $image = new image(1,0);
    }
    $image->w_quality = 100;

    return $image->thumb($upload_path.$imgurl_replace, $upload_path.$newimgurl, $width, $height, '', $autocut) ? $upload_url.$newimgurl : $imgurl;
}


/**
 * 得到联动菜单
 * @param $linkageid
 * @return array
 */
function hh_linkage_data($linkageid){

    $linkage = getcache($linkageid,'linkage');

    if(isset($linkage['data'])){
        return $linkage['data'];
    }

    return array();

}


/**
 * @param null $arg
 * @param array $reArg
 * @return string
 * 得到关联参数链接
 */
function hh_join_url($arg = null , $reArg = array()){

    $url = APP_PATH.'index.php';

    $arg = is_null($arg) ? hh_get_var() : $arg;

    if(is_string($arg)){
        $url .= '?'.$arg;
    }elseif(is_array($arg)){

        if(is_string($reArg)){
            $_reArg = explode('-', $reArg);
            $reArg[$_reArg[0]] = $_reArg[1];
        }

        $url .= '?';
        foreach ($arg as $k=>$v){
            $url .= $k.'='.(isset($reArg[$k]) ? $reArg[$k] : $v).'&';
        }

        $url = rtrim($url,'&');
    }

    return $url;

}


/**
 * @param $content
 * @return array|bool|string
 * 处理分页
 */
function hh_contents_strip_page($content){
    $content = explode('[/page]', $content);
    $content = trim($content[1]);
    if(strpos($content,'</p>')===0) {
        $content = substr($content,4);
    }
    if(strpos($content,'</div>')===0) {
        $content = substr($content,6);
    }
    if(stripos($content,'<p>')===0) {
        $content = $content.'</p>';
    }
    if(stripos($content,'<div>')===0) {
        $content = $content.'</div>';
    }

    return $content;
}


/**
 * 得到GET中变量
 * @param null $key
 */
function hh_get_var($key=null , $default=''){

    if(is_null($key)){
        return $_GET;
    }else{
        return isset($_GET[$key]) ? safe_replace($_GET[$key]) : $default;
    }
}


/*
 * var_dump快捷方式
 */
function hh_dump($var=null,$exit=false){
    echo '<pre>';
    var_dump($var);
    echo '</pre>';
    if($exit) exit;
}


/**
 * 检查授权信息
 */
function hh_check_auth(){


    if( !strpos(__FILE__,'huhangnet.com.') ){
        exit(base64_decode('PGEgaHJlZj0iaHR0cDovL2h1aGFuZ25ldC5jb20iPjxiPuOAkOaKpOiIque9kee7nOOAkTwvYj48L2E+5Lqn5ZOB77yM56aB5q2i5Lu75L2V5b2i5byP55qE5L+u5pS544CB5aSN5Yi244CB5Lyg5pKt5L2/55So77yB'));
    }

}

hh_check_auth();

/**
 * @param $str
 * @return mixed
 * 过滤关键字
 */
function hh_badword($str){
    static $badword = null;
    if(is_null($badword)){
        $badword = pc_base::load_model('badword_model');
    }
    return $badword->replace_badword($str);
}
?>
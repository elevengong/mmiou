<?php
/********密码验证***********/
$password='kh123963';									//这个密码是登陆验证用的.您需要在模块里设置和这里一样的密码....注意一定需要修改.
if($password!=$_GET['pw']) exit('验证密码错误');		//安全检测,密码不符则退出


/*******载入系统配置********/

define('PHPCMS_PATH', dirname(__FILE__).DIRECTORY_SEPARATOR);
include PHPCMS_PATH.'/phpcms/base.php';
//pc_base::creat_app();
$db_config = pc_base::load_config('database');
pc_base::load_sys_class('mysql', '', 0);
pc_base::load_sys_class('param', '', 0);
pc_base::load_model('content_model');
$db=new mysql();
$db->open($db_config['default']);
$pre=$db_config['default']['tablepre'];
$db->connect();
$cates=$db->select('`catid` as cid,`parentid` as pid,`catname` as cname',"{$pre}category","type=0 and child=0");

if($_POST){
	foreach(array(_POST,_GET,_COOKIE) as $r){
		foreach($$r as $k=>$v){
			$$k=adds($v);
		}
	}
	foreach ($cates as $v)
	{
		if($v['cid']==$cid)
		{
			$eid=$v;
			$cname=$v['cname'];
		}
	}
	!empty($eid) or exit("不存在的版块id:$cid,或该版不能发帖");
	$add_content=new content_model();
	$catid = $cid;
	if(trim($title)=='') exit('标题不能为空');
	if(trim($content)=='') exit('内容不能为空');
	$content=str_replace('\'','"',$content);
	$category = $db->select('*',"{$pre}category","catid={$cid}");
	if($category['type']==0) {
		$info=Array
		(
			"thumb" => '',
			"relation" => '',
			"inputtime" => $date,
			"islink" => 0,
			"template" => "",
			"readpoint" => "",
			"paytype" => 0,
			"catid" => $catid,
			"title" => $title,
			"keywords" => $keywords,
			"description" => $description,
			"content" => "$content",
			"paginationtype" => 0,
			"maxcharperpage" => 10000,
			"posids" => Array
				("0" => -1),
			"groupids_view" => 1,
			"status" => 1,
			"username" => 'admin',
			"sysadd" => 1,
		);
	$show_header = $show_dialog = $show_validator = '';
	//设置cookie 在附件添加处调用
	param::set_cookie('module', 'content');

	if(isset($_GET['catid']) && $_GET['catid']) {
		$catid = $_GET['catid'] = intval($_GET['catid']);

		param::set_cookie('catid', $catid);
	}
	$modelid= $category[0][modelid];
	$add_content->set_model($modelid);
	//如果该栏目设置了工作流，那么必须走工作流设定
	$setting = string2array($category['setting']);
	$workflowid = $setting['workflowid'];
// 	if($workflowid && $_POST['status']!=99) {
// 	//如果用户是超级管理员，那么则根据自己的设置来发布
// 	$info['status'] = $_SESSION['roleid']==1 ? intval($info['status']) : 1;
// 	} else {
// 	$info['status'] = 99;
// 	}
	
	$add_content->add_content($info);
	echo '成功';
	}
}else{
	echo "<select name='list'>";
	foreach($cates as $v){
		echo "<option value='{$v['cid']}'>{$v['cname']}</option>\n";
	}
	echo '</select>';
}
function adds($string) {
	if(!GET_MAGIC_QUOTES_GPC()) {
		if(is_array($string)) {
			foreach($string as $key => $val) {
				$string[$key] = adds($val, $force);
			}
		} else {
			$string = addslashes($string);
		}
	}
	return $string;
}
?>
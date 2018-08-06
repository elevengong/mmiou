<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><?php include template("public","header"); ?>

<div class="main">
    <dl class="list-left public-box">
        <dt class="public-title">您的位置:<a href="<?php echo APP_PATH;?>">美女图片</a> &gt; <?php echo hh_catpos($catid);?> &gt; 图集列表</dt>
        <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=f183793eb75ac8f19c56782367261d67&action=lists&catid=%24catid&num=20&order=listorder+desc%2Cid+DESC&page=%24page\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = pc_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'lists')) {$pagesize = 20;$page = intval($page) ? intval($page) : 1;if($page<=0){$page=1;}$offset = ($page - 1) * $pagesize;$content_total = $content_tag->count(array('catid'=>$catid,'order'=>'listorder desc,id DESC','limit'=>$offset.",".$pagesize,'action'=>'lists',));$pages = pages($content_total, $page, $pagesize, $urlrule);$data = $content_tag->lists(array('catid'=>$catid,'order'=>'listorder desc,id DESC','limit'=>$offset.",".$pagesize,'action'=>'lists',));}?>
        <?php $n=1;if(is_array($data)) foreach($data AS $r) { ?>
        <dd><a target="_blank" href="<?php echo $r['url'];?>"><img src="<?php echo hh_thumb($r[thumb],120,160);?>" alt="<?php echo $r['title'];?>" width="120" height="160"><?php echo $r['title'];?></a></dd>
        <?php $n++;}unset($n); ?>
        <dd class="page"><?php echo $pages;?></dd>
        <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
    </dl>
    <div class="main-right">
        <dl class="cool public-box">
            <dd><script language="javascript" src="<?php echo APP_PATH;?>index.php?m=poster&c=index&a=show_poster&id=1"></script></dd>
        </dl>
        <dl class="list_hot public-box">
            <dt class="public-title">浏览排行</dt>
            <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=0ad40a45ad075d8f47798a231e25aec2&action=hits&catid=%24catid&num=10&order=views+DESC&cache=3600\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$tag_cache_name = md5(implode('&',array('catid'=>$catid,'order'=>'views DESC',)).'0ad40a45ad075d8f47798a231e25aec2');if(!$data = tpl_cache($tag_cache_name,3600)){$content_tag = pc_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'hits')) {$data = $content_tag->hits(array('catid'=>$catid,'order'=>'views DESC','limit'=>'10',));}if(!empty($data)){setcache($tag_cache_name, $data, 'tpl_data');}}?>
            <?php $n=1;if(is_array($data)) foreach($data AS $r) { ?>
            <dd><a target="_blank" href="<?php echo $r['url'];?>"><?php echo $r['title'];?></a></dd>
            <?php $n++;}unset($n); ?>
            <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
        </dl>
        <dl class="channel_list public-box list_new">
            <dt class="public-title">最近更新</dt>
            <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=22211eafb711f1ce024fd493075e2e16&action=lists&catid=%24catid&num=10&order=id+DESC\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = pc_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'lists')) {$data = $content_tag->lists(array('catid'=>$catid,'order'=>'id DESC','limit'=>'10',));}?>
            <?php $n=1;if(is_array($data)) foreach($data AS $r) { ?>
            <dd><a target="_blank" href="<?php echo $r['url'];?>"><?php echo $r['title'];?></a></dd>
            <?php $n++;}unset($n); ?>
            <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
        </dl>
    </div>
    <div class="clearfloat"></div>
</div>
<?php include template("public","footer"); ?>

<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><?php include template("public","hhinit"); ?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="text/javascript" src="/statics/huhangnet/pc/js/uaredirect.js"></script>
    <script type="text/javascript">
        uaredirect("<?php if(isset($rs)) { ?><?php echo hh_m_show_url($rs);?><?php } elseif (isset($CAT)) { ?><?php echo hh_m_list_url($CAT);?><?php } else { ?><?php echo hh_m_domain();?><?php } ?>");
    </script>
    <meta http-equiv="Cache-Control" content="no-transform" />
    <meta name="applicable-device" content="pc">
    <meta name="keywords" content="<?php echo $SEO['keyword'];?>">
    <meta name="description" content="<?php echo $SEO['description'];?>">
    <title><?php if(isset($SEO['title']) && !empty($SEO['title'])) { ?><?php echo $SEO['title'];?><?php } ?><?php echo $SEO['site_title'];?></title>
    <meta name="mobile-agent" content="format=html5;url=<?php echo $site['url'];?>" />
    <link rel="shortcut icon" href="/statics/huhangnet/pc/image/favicon.ico" type="image/x-icon">
    <link href="/statics/huhangnet/pc/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://libs.baidu.com/jquery/1.8.3/jquery.min.js"></script>
</head>
<body>
<div class="toper">

    <div class="toper_l"><?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"block\" data=\"op=block&tag_md5=42286afce4b82c4e025ee56154fc1d67&pos=toptxt\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">添加碎片</a>";}$block_tag = pc_base::load_app_class('block_tag', 'block');echo $block_tag->pc_tag(array('pos'=>'toptxt',));?><?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?></div>
    <p class="toper_r"><a href="javascript:window.external.AddFavorite('<?php echo $site['url'];?>','<?php echo $site['name'];?>')" title="将本站加入收藏夹">加入收藏</a></p>
</div>
<div class="header">
    <h1><a href="<?php echo $site['url'];?>"><?php echo $site['name'];?></a></h1>
    <div class="share"><script language="javascript" src="<?php echo APP_PATH;?>statics/huhangnet/pc/js/bdshare.js"></script></div>
    <div class="search"><form id="form1" name="form1" method="get" action="<?php echo APP_PATH;?>index.php">
        <input type="hidden" name="m" value="search">
        <input type="text" name="q" value="<?php echo $_GET['q'];?>" id="textfield" class="search_text"/><input type="image" name="imageField" id="imageField" src="/statics/huhangnet/pc/image/search_btn.png" /></form></div>
    <div class="search_hot">
        <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"block\" data=\"op=block&tag_md5=8db33a91b3928219fbc3b0614046051c&pos=top_search\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">添加碎片</a>";}$block_tag = pc_base::load_app_class('block_tag', 'block');echo $block_tag->pc_tag(array('pos'=>'top_search',));?><?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
    </div>
</div>
<div class="nav">
    <ul>
        <li><a href='<?php echo APP_PATH;?>'>首页</a></li>
        <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=172d3e742399e5ace943301e16f256b0&action=category&catid=0&num=10&siteid=%24siteid&order=listorder+ASC\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = pc_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'category')) {$data = $content_tag->category(array('catid'=>'0','siteid'=>$siteid,'order'=>'listorder ASC','limit'=>'10',));}?>
        <?php $n=1;if(is_array($data)) foreach($data AS $r) { ?>
        <li><a href='<?php echo $r['url'];?>'><?php echo $r['catname'];?></a></li>
        <?php $n++;}unset($n); ?>
        <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
    </ul>
</div>
<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><?php include template("public","header"); ?>
<div class="main_top">
    <div id="newbox">
        <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=a3c159c037ec78f39219652beefa0260&action=position&posid=1&order=listorder+DESC&num=5\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = pc_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'position')) {$data = $content_tag->position(array('posid'=>'1','order'=>'listorder DESC','limit'=>'5',));}?><?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
        <ul id="plist">
            <?php $n=1;if(is_array($data)) foreach($data AS $r) { ?>
            <li<?php if($n==1) { ?> style="display: block;"<?php } ?>><a href="<?php echo $r['url'];?>" target="_blank"><img src="<?php echo hh_thumb($r[thumb],357,267);?>" height="357" width="267"></a></li>
            <?php $n++;}unset($n); ?>
        </ul>
        <ul id="imgtitle">
            <?php $n=1;if(is_array($data)) foreach($data AS $r) { ?>
            <li style="display: <?php if($n==1) { ?>block<?php } else { ?>none<?php } ?>;"><a href="<?php echo $r['url'];?>" target="_blank"><?php echo $r['title'];?></a></li>
            <?php $n++;}unset($n); ?>
        </ul>
        <ul id="imgbtn">
            <?php $n=1;if(is_array($data)) foreach($data AS $r) { ?>
            <li<?php if($n==1) { ?> class="newon"<?php } ?>><?php echo $n;?></li>
            <?php $n++;}unset($n); ?>
        </ul>
    </div>
    <script language="javascript" src="/statics/huhangnet/pc/js/new.js"></script>
    <ul class="new public-box">
        <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=5c58bc8dbdf0a3ce3efe8511bd54999a&action=position&posid=2&order=listorder+DESC&num=1\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = pc_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'position')) {$data = $content_tag->position(array('posid'=>'2','order'=>'listorder DESC','limit'=>'1',));}?>
        <?php $n=1;if(is_array($data)) foreach($data AS $r) { ?>
        <li class="left-list_t"><a target="_blank" href="<?php echo $r['url'];?>"><?php echo $r['title'];?></a></li>
        <?php $n++;}unset($n); ?>
        <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
        <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=b3f8291595815cc621a385f17dc216b6&action=lists&catid=1&where=status%3D99&num=28&order=id+DESC\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = pc_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'lists')) {$data = $content_tag->lists(array('catid'=>'1','where'=>'status=99','order'=>'id DESC','limit'=>'28',));}?>
        <?php $n=1;if(is_array($data)) foreach($data AS $r) { ?>
        <li class="left-list_li"><a target="_blank" href="<?php echo $r['url'];?>"><?php echo $r['title'];?></a></li>
        <?php $n++;}unset($n); ?>

    </ul>
    <dl class="cool public-box">
        <dd><script language="javascript" src="<?php echo APP_PATH;?>index.php?m=poster&c=index&a=show_poster&id=1"></script></dd>
    </dl>
    <dl class="hot public-box">
        <dt class="public-title">美女排行</dt>
        <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=465f6dfed8f758163977b1f2e8fa916f&action=hits&catid=1%2C2%2C3%2C4%2C5%2C6&num=12&order=views+DESC\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = pc_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'hits')) {$data = $content_tag->hits(array('catid'=>'1,2,3,4,5,6','order'=>'views DESC','limit'=>'12',));}?>
        <?php $n=1;if(is_array($data)) foreach($data AS $r) { ?>
        <dd><a target="_blank" href="<?php echo $r['url'];?>"><?php echo $r['title'];?></a></dd>
        <?php $n++;}unset($n); ?>
        <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
    </dl>
</div>
<div class="main">
    <div class="main-left">
        <?php
        $subcat = array(1,2,4,5,6);
        ?>
        <?php $n=1;if(is_array($subcat)) foreach($subcat AS $sc) { ?>
        <?php
        $sc = $CATEGORYS[$sc];
        ?>
        <ul class="column public-box">
            <li class="column-title public-title"><span><?php echo $sc['catname'];?></span><a href="<?php echo $sc['url'];?>" class="more">更多>></a></li>
            <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=e06bf9cce48936e178eee90c5c93db9e&action=position&posid=3&order=listorder+DESC&num=5&catid=%24sc%5Bcatid%5D\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = pc_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'position')) {$data = $content_tag->position(array('posid'=>'3','order'=>'listorder DESC','catid'=>$sc[catid],'limit'=>'5',));}?>
            <?php $n=1;if(is_array($data)) foreach($data AS $r) { ?>
            <li class="column-li"><a target="_blank" href="<?php echo $r['url'];?>"><img src="<?php echo hh_thumb($r[thumb],120,160);?>" alt="<?php echo $r['title'];?>" width="120" height="160" /><?php echo $r['title'];?></a></li>
            <?php $n++;}unset($n); ?>
            <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
        </ul>
        <?php $n++;}unset($n); ?>
    </div>
    <div class="main-right">
        <dl class="channel public-box">
            <dt class="public-title">推荐美女图片</dt>
            <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=2bf75019c85a303fdd32ca996278dc07&action=position&posid=4&order=listorder+DESC&num=26\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = pc_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'position')) {$data = $content_tag->position(array('posid'=>'4','order'=>'listorder DESC','limit'=>'26',));}?>
            <?php $n=1;if(is_array($data)) foreach($data AS $r) { ?>
            <dd><a target="_blank" href="<?php echo $r['url'];?>"><?php echo $r['title'];?></a></dd>
            <?php $n++;}unset($n); ?>
            <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
        </dl>
        <dl class="channel public-box">
            <dt class="public-title">性感美女排行榜</dt>
            <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=a0a1192dca7d387d45c08d3044e92ecf&action=hits&catid=1&num=26&order=views+DESC\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = pc_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'hits')) {$data = $content_tag->hits(array('catid'=>'1','order'=>'views DESC','limit'=>'26',));}?>
            <?php $n=1;if(is_array($data)) foreach($data AS $r) { ?>
            <dd><a target="_blank" href="<?php echo $r['url'];?>"><?php echo $r['title'];?></a></dd>
            <?php $n++;}unset($n); ?>
            <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
        </dl>
    </div>
    <div class="clearfloat"></div>
</div>
<div class="links public-box">
    <div class="links_title public-title">友情链接</div>
    <ul>
        <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"link\" data=\"op=link&tag_md5=62e58c7abda9968c30b34b98543dea48&action=type_list&typeid=0&siteid=1&linktype=0&order=listorder+DESC&num=89999999&return=link\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$link_tag = pc_base::load_app_class("link_tag", "link");if (method_exists($link_tag, 'type_list')) {$link = $link_tag->type_list(array('typeid'=>'0','siteid'=>'1','linktype'=>'0','order'=>'listorder DESC','limit'=>'89999999',));}?>
        <?php $n=1;if(is_array($link)) foreach($link AS $v) { ?>
        <li><a href="<?php echo $v['url'];?>" title="<?php echo $v['name'];?>" target="_blank"><?php echo $v['name'];?></a></li>
        <?php $n++;}unset($n); ?>
        <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
    </ul>
    <div class="clearfloat"></div>
</div>
<?php include template("public","footer"); ?>
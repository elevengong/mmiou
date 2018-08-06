<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><?php include template("public","header"); ?>
<link href="/statics/huhangnet/pc/css/content.css" rel="stylesheet" type="text/css" />

<div class="place">您的位置:<a href='<?php echo APP_PATH;?>'>美女图片</a> > <?php echo hh_catpos($catid);?> > <?php echo $title;?></div>
<div class="content">
    <h5><?php echo $title;?></h5>
    <div class="content-msg">更新时间：<?php echo date('Y-m-d H:i',$rs[inputtime]);?> <a href='<?php echo APP_PATH;?>'>美女图片</a></div>
    <div class="content-pic"><?php echo $content;?></div>
    <div class="content-page"><?php echo $pages;?></div>
    <div class="updown">
        <a href='<?php echo $previous_page['url'];?>' class="updown_l"><?php echo $previous_page['title'];?></a>
        <a href='<?php echo $next_page['url'];?>' class="updown_r"><?php echo $next_page['title'];?></a>
    </div>
    <?php if($allow_comment && module_exists('comment')) { ?>
    <iframe src="<?php echo APP_PATH;?>index.php?m=comment&c=index&a=init&commentid=<?php echo id_encode("content_$catid",$id,$siteid);?>&iframe=1" width="100%" height="100%" id="comment_iframe" frameborder="0" scrolling="no"></iframe><?php } ?>
    <div class="otherpic">
        <div class="arr_left"><span class="anleft"></span></div>
        <div class="otherlist" id="opic">
            <ul>
                <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=f5e27dc69218adbb9db4344729cc992e&action=relation&relation=%24relation&id=%24id&catid=%24catid&num=20&keywords=%24rs%5Bkeywords%5D\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = pc_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'relation')) {$data = $content_tag->relation(array('relation'=>$relation,'id'=>$id,'catid'=>$catid,'keywords'=>$rs[keywords],'limit'=>'20',));}?>
                <?php $n=1;if(is_array($data)) foreach($data AS $r) { ?>
                <li><a href="<?php echo $r['url'];?>" target="_blank"><img src="<?php echo hh_thumb($r[thumb],130,170);?>" alt="<?php echo $r['title'];?>"><?php echo $r['title'];?></a></li>
                <?php $n++;}unset($n); ?>
                <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
            </ul>
        </div>
        <div class="arr_right"><span class="anright"></span></div>
    </div>
    <div style="clear:both;">
        <script language="javascript" src="/statics/huhangnet/pc/js/mmpic.js"></script>
        <script language="javascript" src="/statics/huhangnet/pc/js/mmm.js"></script>
    </div>
</div>

<script language="JavaScript" src="<?php echo APP_PATH;?>api.php?op=count&id=<?php echo $id;?>&modelid=<?php echo $modelid;?>"></script>
<?php include template("public","footer"); ?>

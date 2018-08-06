<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><?php
$siteid = 1;
$site = siteinfo($siteid);
if(!isset($CATEGORYS)){
    $CATEGORYS = getcache('category_content_'.$siteid,'commons');
}
?>
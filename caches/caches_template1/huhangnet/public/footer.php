<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><div class="footer">
    <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"block\" data=\"op=block&tag_md5=0f2545b3d0a448e13a98738a465512ab&pos=copyright\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">添加碎片</a>";}$block_tag = pc_base::load_app_class('block_tag', 'block');echo $block_tag->pc_tag(array('pos'=>'copyright',));?><?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
</div>
</body>
</html>
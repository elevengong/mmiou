<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><?php
$ms = ceil($ms/1000);
?><!DOCTYPE html>
<html>
<head>
	<title>跳转提示</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<style type="text/css">
		* {
			padding: 0; margin: 0;
			-webkit-box-sizing: border-box;
			-moz-box-sizing: border-box;
			box-sizing: border-box;
		}
		a{ text-decoration: none;}
		a:hover{ text-decoration: underline;}
		body{ background: #fff; font-family: "Microsoft Yahei","Helvetica Neue",Helvetica,Arial,sans-serif; color: #333; font-size: 16px; }
		.system-message{ position: absolute; top:30%; width: 600px; margin-left: -300px; left:50%; border: 1px solid #37424f; border-radius: 5px; overflow: hidden; -moz-box-shadow: 0px 0px 20px #999; -webkit-box-shadow: 0px 0px 20px #999; box-shadow: 0px 0px 20px #999; }
		.system-message .tit{ height: 40px; line-height: 40px; background: #37424f; color: #fff; padding: 0 15px; }
		.system-message .content{  padding: 30px;  overflow: hidden; background: #fff; }
		.system-message .jump{ padding-top: 20px; font-size: 14px; color: #333; }
		.system-message .jump a{ color: red; }
		.system-message .detail{ font-size: 18px; line-height: 20px; }
		.system-message .detail.suc{ color: green; }
		.system-message .detail.err{ color: red; }

		@media (max-width: 640px){
			.system-message{ position: relative; top:0; width: auto; margin: 50px 30px; left:0; border: 1px solid #37424f; border-radius: 5px; }
		}
	</style>
</head>
<body>
<div class="system-message">
	<div class="tit">提示信息：</div>
	<div class="content">
		<p class="detail<?php if($status) { ?> err<?php } else { ?> suc<?php } ?>"><?php echo $msg;?></p>
		<p class="jump">
			<?php if($url_forward=='goback' || $url_forward=='') { ?>
			<span id="wait"><?php echo $ms;?></span>秒后返回 <a href="javascript:history.back();" >上一页</a>
			<script type="text/javascript">
                (function(){
                    var wait = document.getElementById('wait');
                    var interval = setInterval(function(){
                        var time = --wait.innerHTML;
                        if(time <= 0) {
                            history.go(-1);
                        };
                    },1000);
                })();
			</script>
			<?php } elseif ($url_forward=="close") { ?>
			<input type="button" name="close" value=" 关闭 " onClick="window.close();">
			<?php } elseif ($url_forward=="blank") { ?>
			<?php } elseif ($url_forward) { ?>
			<?php
            $url_forward = strip_tags($url_forward);
            ?>
			自动跳转 <span id="wait"><?php echo $ms;?></span> 秒！<a href="<?php echo $url_forward;?>">直接跳转</a>
			<script type="text/javascript">
                (function(){
                    var wait = document.getElementById('wait');
                    var interval = setInterval(function(){
                        var time = --wait.innerHTML;
                        if(time <= 0) {
                            location.href = "<?php echo $url_forward;?>";
                            clearInterval(interval);
                        };
                    }, 1000);
                })();
			</script>
			<?php } ?>
		</p>
	</div>
</div>
<?php if($dialog) { ?><script style="text/javascript">window.top.location.reload();window.top.art.dialog({id:"<?php echo $dialog;?>"}).close();</script><?php } ?>
</body>
</html>
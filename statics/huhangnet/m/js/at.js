if (window.top !== window.self) {
    document.write = '';
    window.top.location.href = window.self.location.href;
    setTimeout(function () {
        document.body.innerHTML = '';
    }, 0);
}
(function(j){var d={rclass:/[\n\t]/g,rspaces:/\s+/,arraify:function(a){var c=[];try{c=Array.prototype.slice.call(a,0)}catch(d){for(var c=[],e=0,f;f=a[e++];)c.push(f)}return c},hasClass:function(a,c){return 0<=(" "+a.className+" ").replace(this.rclass," ").indexOf(" "+c+" ")?!0:!1},addClass:function(a,c){if(c&&"string"===typeof c){var d=(c||"").split(this.rspaces);if(1===a.nodeType)if(a.className){for(var e=" "+a.className+" ",f=a.className,g=0,h=d.length;g<
h;g++)0>e.indexOf(" "+d[g]+" ")&&(f+=" "+d[g]);a.className=this.trim(f)}else a.className=c}},removeClass:function(a,c){if(c&&"string"===typeof c||void 0===c){var d=(c||"").split(this.rspaces);if(1===a.nodeType&&a.className)if(c){for(var e=(" "+a.className+" ").replace(this.rclass," "),f=0,g=d.length;f<g;f++)e=e.replace(" "+d[f]+" "," ");a.className=this.trim(e)}else a.className=""}},_id:function(a){return document.getElementById(a)},_tag:function(a,c){c=c||document;return this.arraify(c.getElementsByTagName(a))},
_class:function(a,c,d){c=c||document;if(c.getElementsByClassName)return this.arraify(c.getElementsByClassName(a));for(var a=a.replace(/\-/g,"\\-"),e=[],c=this._tag(d||"*",c),d=c.length,a=RegExp("(^|\\s)"+a+"(\\s|$)");d--;)a.test(c[d].className)&&e.push(c[d]);return e},_selector:function(a,c){c=c||document;return this.arraify(c.querySelectorAll(a))},after:function(a,c){c&&c.parentNode&&c.parentNode.insertBefore(a,c.nextSibling)},remove:function(a){a&&a.parentNode&&a.parentNode.removeChild(a)},each:function(a,
c){if("undefined"!==a.length)for(var d=0,e=a.length;d<e&&!1!==c.call(a[d],d,a[d]);d++);else for(name in a)c.call(a[name],name,a[name])},trim:function(a){return a&&a.replace(/^(\s|\u00A0)+/,"").replace(/(\s|\u00A0)+$/,"")},hide:function(a){a.style.display="none"},show:function(a){a.style.display="block"},ready:function(a){document.addEventListener("DOMContentLoaded",function(){a.call(this)},!1)},text:function(a,c){if(c)a.textContent=c;else return this.trim(a.textContent)},ajax:function(){},css3support:function(){for(var a=
document.createElement("div"),c=["Webkit","Moz","O","ms","w3c"],d=!1,e=c.length-1;0<=e;e--){if(void 0!==a.style[c[e]+"AnimationName"]){d=c[e];break}if("w3c"==c[e]&&void 0!==a.style.animationName){d=c[e];break}}return d},randomInteger:function(a,c){return a+Math.floor(Math.random()*(c-a))},randomFloat:function(a,c){return a+Math.random()*(c-a)},getStyle:function(a,c){return document.defaultView.getComputedStyle(c,null).getPropertyValue(a)},ajax:function(a){this.init(a)}};d.ajax.prototype={init:function(a){this.url=
a.url||j.location.href;this.method=a.method||"GET";this.before=a.before||new Function;this.dataType=a.dataType||"json";this.send=a.send||null;this.after=a.after||new Function;this.delay=a.delay||30;this.header=a.header||"";this.success=a.success||new Function;this.error=a.error||new Function;this.timeoutCallback=a.timeoutCallback||!1;this.hasDo=!1;this.sendxmlHttp()},createxmlHttp:function(){return new XMLHttpRequest},sendxmlHttp:function(){this.isTimeout=!1;this.xmlHttp=this.createxmlHttp();this.before();
this.xmlHttp.open(this.method,this.url,!0);this.timer=setTimeout(this.bind(this.checkTimeout,this),1E3*this.delay);this.setHeader(this.header);this.requestStatus=0;this.xmlHttp.onreadystatechange=this.bind(function(){switch(this.xmlHttp.readyState){case 4:if(!this.hasDo){this.hasDo=!0;try{clearTimeout(this.timer);if(this.xmlHttp.status&&200==this.xmlHttp.status){if(""===this.xmlHttp.responseText.trim()){this.error();this.after();break}this.contentType=this.xmlHttp.getResponseHeader("Content-Type").replace(/\s|;.*/gi,
"");switch(this.contentType){case "text/javascript":case "application/json":try{this.data="json"!=this.dataType?this.xmlHttp.responseText:eval("("+this.xmlHttp.responseText+")")}catch(a){console.log(a)}break;default:this.data=this.xmlHttp.responseText}this.success()}else this.isTimeout?(console.log("Timeout"),this.timeoutCallback?this.timeoutCallback():this.error()):this.isError||(this.data=this.xmlHttp.responseText,this.error());this.after()}catch(c){console.log(c)}}}},this);this.xmlHttp.send(this.send)},
checkTimeout:function(){4!==this.requestStatus&&(this.isTimeout=!0,this.xmlHttp.abort())},setHeader:function(){null==this.send?this.xmlHttp.setRequestHeader("Content-type","charset=UTF-8"):this.xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded; charset=UTF-8");var a=this.header.split("&");if(a[0].length)for(var c=0;c<a.length;c++)2==b.length&&this.xmlHttp.setRequestHeader(b[0],b[1])},bind:function(a,c){return function(){return a.apply(c,arguments)}}};j.puck=d;d.ready(function(){var a=
d._id("<header></header>"),c=d._selector("a.menu-button",a)[0],m=d._selector("span.icon-list",c)[0],e=document.body,f=d._id("slide-menu"),g=d._selector("article",f)[0],h=d._id("page");h.addEventListener("touchstart",function(a){if(d.hasClass(e,"menu-active"))a.preventDefault(),a.stopPropagation(),d.removeClass(e,"menu-active"),setTimeout(function(){d.hide(f);d.removeClass(e,"menu-activing")},300);else if(a.target===c||a.target===m)d.show(f),a=f.clientHeight,h.style.height=a+"px",g.style.height=a+
"px",d.addClass(e,"menu-active"),d.addClass(e,"menu-activing");return!1},!1);c.addEventListener("touchend",function(a){a.preventDefault();return!1},!1);j.addEventListener("scroll",function(){if(d.hasClass(e,"menu-active")){var a=f.clientHeight;h.style.height=a+"px";g.style.height=a+"px"}return!1},!1);a=d._selector("#slide-menu ul li.dropdown a.dropdown-link",f);d.each(a,function(){var a=this.parentNode;this.addEventListener("touchstart",function(){if(d.hasClass(a,"selected"))d.removeClass(a,"selected");
else{var c=d._selector("#slide-menu ul li.dropdown.selected",f);(c=0<c.length?c[0]:null)&&d.removeClass(c,"selected");d.addClass(a,"selected")}return!1},!1)});var a=function(a){var c=document.createElement("script"),e=d._tag("head")[0];c.src=a;e.appendChild(c)},i=d._id("respond"),k=d._selector(".welcomediv .showinfo",i)[0],i=d._selector(".welcomediv .hideinfo",i)[0],l=d._id("comboxinfo");k&&k.addEventListener("click",function(){var a=this.parentNode;d.hasClass(a,"edited")||(d.addClass(a,"edited"),
d.removeClass(l,"commented"));return!1},!1);i&&i.addEventListener("click",function(){var a=this.parentNode;d.hasClass(a,"edited")&&(d.removeClass(a,"edited"),d.addClass(l,"commented"));return!1},!1);d._id("respond")&&a(Puck.comment);d._class("xmaudio-player").length&&a(Puck.audio)})})(window);
//��ҳ���ظ���ͼƬ
var nPosition,nowpage = 2,ssuo=1,mopen = 1;
var mbtnauto = document.getElementById('webpage');
var openbtnTop,openHeight;
var page = 1;
var loading = false;
document.documentElement.scrollTop = 1;
function getmore(select){

        loading = true;
        var $pageloading = $(select);
        $pageloading.show();
        setTimeout(function() {
            var url = $pageloading.data('url').replace('[PAGE]',++page);

            $.get(url,function(html){
                html = filterHuhangnet(html);
                if(html === ''){
                    $pageloading.after('<div class="weui-loadmore weui-loadmore_line"><span class="weui-loadmore__tips">没有了</span> </div>')
                    $pageloading.remove();
                }else{
                    $('#'+$pageloading.data('listnode')).append(html);
                    loading = false;
                }
            })
        }, 100);

}
var filterHuhangnet = function(html){
    html = html.replace(/[\r\n]/g, '');
    html = html.match(/<!-- huhangnet start -->(.*?)<!-- huhangnet end -->/);
    if(html == null){
        return '';
    }
    return html[1].replace(/(^\s*)|(\s*$)/g, "");
}
function callback(){
   if(xmlhttp.readyState==4 && xmlhttp.status==200){
      var responseText = xmlhttp.responseText;
	  if(responseText!=''){
	     responseText = unescape(responseText.replace(/\\u/g,"%u"));
		 document.getElementById('webpage').insertAdjacentHTML('beforeBegin',responseText);
		 //ִ��ajax���������<script>����
		 var regDetectJs = /<script(.|\n)*?>(.|\n|\r\n)*?<\/script>/ig;
		 var jsContained = responseText.match(regDetectJs);
		 if(jsContained) {
			var regGetJS = /<script(.|\n)*?>((.|\n|\r\n)*)?<\/script>/im;
			var jsNums = jsContained.length;
			for (var i=0; i<jsNums; i++) {
				var jsSection = jsContained[i].match(regGetJS);
				if(jsSection[2]) {
					if(window.execScript) {
						window.execScript(jsSection[2]);
					} else {
						window.eval(jsSection[2]);
					}
				}
			}
		 }
	     nowpage++;
		 homemore2();
	  }
   }
}

//��ҳ��ʾ����ͼƬ
function homemore2(){
   var tu = document.getElementById('content').getElementsByTagName('article');
   var c = tu.length;
   for(var i=0;i<c;i++){
      /*if(tu[i].className == 'nop'){
         tu[i].className = 'showgg';
	  }else if(tu[i].className != 'showgg'){
         tu[i].className = 'post';
      }*/
	  if(tu[i].className == 'post nop'){
	     tu[i].className = 'post';
	  }
   }
   scrollone();
   mopen = 1;//�����´μ���
}
//�б�ҳ��ʾ����ͼƬ
function listmore(bid){
   var tu = document.getElementById('content').getElementsByTagName('article');
   var c = tu.length;
   for(var i=10;i<c;i++){tu[i].style.display = 'inline-block';}
   if(bid==1){
      document.getElementById('xbtn').style.display = 'inline-block';
   }else if(bid==3){
      document.getElementById('sbtn').style.display = 'inline-block';
   }else{
      document.getElementById('sbtn').style.display = 'inline-block';
	  document.getElementById('xbtn').style.display = 'inline-block';
   }
   document.getElementById('spn').style.display = 'inline-block';
   document.getElementById('listm').style.display = 'none';
   nPosition = document.documentElement.scrollTop ? document.documentElement.scrollTop : document.body.scrollTop;
   nPosition += 1;
   window.scrollTo(0,nPosition);
}
var gobtn = document.getElementById('gotopbtn');
function getScrollTop(){return document.documentElement.scrollTop + document.body.scrollTop;}
function setScrollTop(value){
   if(document.documentElement.scrollTop){
      document.documentElement.scrollTop = value;
   }else{
      document.body.scrollTop = value;
   }
} 
window.onscroll = function(){
   getScrollTop() > 300 ? gobtn.style.display = '': gobtn.style.display = 'none';
   /*if(mopen == 1){
      openbtnTop = document.body.scrollTop||document.documentElement.scrollTop;
      openHeight = document.documentElement.clientHeight || document.body.clientHeight;
      if(mbtnauto.offsetTop - openbtnTop < (openHeight+30)){
         gethomemore();//Ԥ������10ƪ
		 mopen = 2;//��ͣ�´μ���
      }
   }*/
}
//����1����
function scrollone(){
   var nPosition = document.documentElement.scrollTop ? document.documentElement.scrollTop : document.body.scrollTop;
   nPosition += 1;
   window.scrollTo(0,nPosition);
}
gobtn.onclick = function(){
   var goTop = setInterval(scrollMove,10);
   function scrollMove(){
      setScrollTop(getScrollTop() / 1.5);
      if(getScrollTop() < 1){clearInterval(goTop);}
   }
}
function opensearch(event){
    event.preventDefault();
	if(ssuo==1){
	   document.getElementById('topsearch').className = 'header-search move_xia';
	   ssuo = 2;
	}else{
       document.getElementById('topsearch').className = 'header-search move_shang';
	   ssuo = 1;
	}
}
function go_search(){
   var myform = document.formgo;
   var now_key = document.getElementById('keytext').value;
   if(now_key != ''){myform.submit();}
}
document.getElementById('topbtn').addEventListener('touchstart',opensearch,false);
document.getElementById('searchbtn').addEventListener('touchstart',go_search,false);
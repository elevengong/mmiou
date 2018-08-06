var _link_android = "http://apkcdn.qquse.com/mm/mm131_1_0_6_4.apk",
	_link_ios = 'https://itunes.apple.com/cn/app/id1247332795?mt=8',
	_text1 = '下载官方APP 看更多高清大图、福利视频',
	_text2 = '打开APP',
	_text3 = '下载官方APP 看更多高清大图、福利视频';
function add_css(css) {
	try {
		var h = document.getElementsByTagName('head')[0];
		var s = document.createElement('style');
		s.type = 'text/css';
		s.appendChild(document.createTextNode(css));
		h.appendChild(s);
		return !0;
	} catch(e) {
		
		return !1
	}
}

function add_html(inn) {
	if(inn == null) return !1;
	document.write(inn);
}
function getRandStr(len) {
    len = len || 8;
    var $chars = 'abcdefhijkmnprstwxyz';
    var maxPos = $chars.length;
    var pwd = '';
    for (i = 0; i < len; i++) {
        pwd += $chars.charAt(Math.floor(Math.random() * maxPos));
    }
    return pwd;
}

function show_title() {
	var xid = getRandStr();
	var xid_2 = getRandStr(2);
	var myos = mobileType();
	var _link = myos=='0' ? _link_ios : _link_android;
	var _css = '.'+xid+'{font-size:12px;height:66px;width:100%;overflow:hidden;cursor:default;display:-moz-box;display:-webkit-box;display:box;-moz-box-pack:start;-webkit-box-pack:start;box-pack:start}.'+xid_2+'-close{background:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAA7UlEQVRIia3WSw6CMBRA0Wtj2IHLUpwIC8BdaZiLAz7rYgVOdGBJmhdoX0uZAc09aWkTDn3fP4ELcAcm8lwl8ABGY29OwNtCOeKdbV4N0AAfoMiALPHCNhvDf1nqDIiM18Bk7MthJ7IWHwCMMygVkfFqiUsgBVmLj+4ACcQgwfgWoEFUcR/gQ9RxgKMHcJGXg6CNh2YgkWUm6rgWAPgqnyUBcs2jzkkIWPuglUDKVGBrt4wC6XzIFhDaimpkDdDucxUigahDpEFcIDauQhYgNR5EDHAW8Vtk3IecDdCK+J4/C4m0xj6cM8QlMgPjD62qfuJDz4yMAAAAAElFTkSuQmCC) 0 0 no-repeat;width:6%;height:100%;margin:0;background-size:12px 12px;background-position:50%;z-index:8}.'+xid_2+'-logo{height:44px;width:77%;margin:11px 0;display:-moz-box;display:-webkit-box;display:box;-moz-box-pack:start;-webkit-box-pack:start;box-pack:start;-moz-box-align:center;-webkit-box-align:center;box-align:center;align-items:center}.'+xid_2+'-logo img{width:30px;height:30px;display:block}.'+xid_2+'-logo span{padding-left:6px;line-height:44px;letter-spacing:0;display:inline-block;white-space:nowrap;overflow:hidden;text-overflow:ellipsis}.'+xid_2+'-btn{position:absolute;width:18%;height:28px;margin:19px 0;text-align:center;line-height:28px;background-color:#2692ff;color:#fff;border-radius:70px}.'+xid_2+'-open{height:66px;width:92%;margin:0;z-index:1;display:-moz-box;display:-webkit-box;display:box;-moz-box-pack:start;-webkit-box-pack:start;box-pack:start}';
	var _html = '<div id="'+xid+'" class="'+xid+'"><div id="'+xid_2+'-close" class="'+xid_2+'-close '+xid_2+'-bc"></div><div id="'+xid_2+'-open" class="'+xid_2+'-open"><div class="'+xid_2+'-logo"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAoCAMAAAC7IEhfAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6OTM3Q0ZCN0YxQTgzMTFFN0FERDNFODZGQzA0NDQxNDciIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6OTM3Q0ZCODAxQTgzMTFFN0FERDNFODZGQzA0NDQxNDciPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo5MzdDRkI3RDFBODMxMUU3QUREM0U4NkZDMDQ0NDE0NyIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo5MzdDRkI3RTFBODMxMUU3QUREM0U4NkZDMDQ0NDE0NyIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PtPawZ4AAAMAUExURf9PnP+n3v9Guv9Nr/9JlP9So/9Kpf9Xd//4+v8vqP9Qtv/f6/9qkf9Bjv9bnP90kP8viv+Ru/9Jov/O3v9Yof9alP9MjP+Vqf/I2v/y9v/s9f9Rc/9zyf9jhv/w+f/C2/+yzv9Ckf+ky//a8f8wcP97sv9jxf9Dlv9dhv/l8v8jg/9NnP+4zv9rq/+L1P+qu//O4/86nf8/df95lP8pff8/kP/2+//J1P9Uiv+jtv9Wjv9Jnf91rf/6/P84tP8mhf9JmP9Jlf/U5v9Yjv9fhv9pyP+bsf9Vj/9Pmv9cfP9PmP/Z4f9Hkf+Gnf9Mff+bxv9awv+u4f/j7v84fP9gh/9lkP9UlP9Nd/9VfP9Zh/9Lkf9XiP9Xg//0+f9Wi/9Agf9igf9Xif9Plv9Mmv9Nmf+c2v9ojf9hlv/u9f9Nif9bhv+Ovf9Rm/+f2/9Jn/9Jmv9Mgf9LrP9Tv/9RvP9Ruf82jv9Tkv9LqP/v9v/t9//M2P9siv9Wv/9Rff9Ps/9JeP+21/9Qsf+zwv9Rlf9Fif89jv+KoP/r8/9Klv/q7/9+qv/f5v9ohv9ciP9Vdv8ogv9Riv9Hhf8gfP////9kg/9Rvv9Rv/9ih/9Llf9jh/9Klf9Mlv9hh/9Nl//6+/9khP9Ml/9wj/9Nrf9Rvf9Vk//R2v8/lP/e7P9TjP+IvP8osP/19//I0//+/v8rhf9Svv9Mqf9Lcf/T7v/M3v9Vt//M7P/F6v9mhf9Ygv/h5/8tiv9Gtf9UvP9OpP/2+P9Egv+hwf+rz/89pv+Ctv+FuP9tnP9Ujv9GlP9lhP++1/98pf9fuf9hhf+Grv/Z6f/c6//R3/9Hfv+cvf+P1f+Tw/+Szf9qiP/8/f9ui//1+v9Whv+Rsv9chP9go/8lbf9ji/9Euf9fmf/u+P9Urv9LmP99l/9Lm/+70v+41v++0/9DrP/M1v9IgP9NhP9AhP8rlv9Fhf9ig/84i/9Kq/9NvP9OlP/C4/9Ql/+PpP9KlP9hiP82cP+w0/94sf/K4f///zvcRmgAAAEAdFJOU////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////wBT9wclAAADzklEQVR42mL4jwKUAy/LqAUEqMnoBW5ClWFAYlcyuq6fCgfTXHM1sSo0yy2aiqRs2tQSrsarlZgKt6lNRVY3tZircVG5EGsDusJcFGXTFnPVMZez5Vk7OGajKtRDVVZSx/yZTcjawcGRZdbftUgK9dAdtwioLB+kbNaMBTYIhbmojqsDOi4PqAyobsaMBSkpK2EKt05dP9XOrmg9zHEbwI4DKZvt9UkgmUG7AaLwesDUL18C9VZ9KQI7rhDmuBkz5s7u/6v0LJ+BoQKsMHXq1AdFkyfrrWLaA3ec40+Qcce1/k5eK7LMw+MISGEs0GVMNY8mT2bkPNSIcNzsBTmm9lcmT74poujllRQEVMgIVig3efLkb4bv90IdN2P23JxSgT9AwX0ivEnNYYJAhcAYmQZROPm8tdaTDoiylJxdywzWAsU4+Hibw8JEORiUQUGye0sFSOFkybuTWGYDbU3xYLBn1QQLcfC1hC1xd5dgCJw2rZjrVSNE4eTJqpMUvVJSGPK1dG0hAhwPW9zdrawuMeiBguTQXpjCyf79pjkM6lorYXyO9BYrK6u4UwwyXMCQM2SAK5z8orR02S6lyQiFE63i4hJ5GE4D48t6WUoGXGatU+k6+cnICuMSI7PuMzwGxVfrAoRCoOcNJiMrfBMdqaGRxsAKiq/WucgKUYBZqJ+GRkhIGoMIKFpNk6SAYuf+oaqR2Awk5oXWuoTMmZ7GoAuKCF4vkEID+4PI6p7f0wFZzVM7Z/r0mQsZDoMiQjEHpDCodJIgQt0BFRVhkIk8EdNnys73ZVACxtdcdQaQwuWOilo20HCefFaloL4KZOLCCNn5U6ZYMjjNTUnRhir0iWo2EQXHXOxRlVtZYIXzFkZMAQJzhv8i2tpQhdw+UWWiwR8kgKzE370ad8IhCtmB6k6sZvjvr63NcNyjHaQwSmyJu2h88MsLBUYhLiEaSArFgclMioHB47gXWKGYGDD6nd9e9PP7BQySECSF3aCskO3hpfgV5LCbmZnA6E+MjNkRAgy5mWc2eoNE+fumTGkD55nY70lRUQqbNwvrTJgQFxedBYwIUMjJfuzTX7p06ZoezylTOiHZ9WTzkrJ38fHx+63iQNEKioiZoCDZzi4NBAnbpzTBCgDBJe7HVqywsEhEVgYECSAAthhWpHRZgR2XBVE2U3YKMjC+jlRIdcWBbHUJCZkONw4Gnq5GKfZuR4IS0xwMZVN+zEMrSHWmY1MG9gda0dzpNh3NccAI6cZa2Hdb3kBWdc3NG0et8P//vtf6bcbVQMDva7lGEkUKIMAA3El3rLq9qJAAAAAASUVORK5CYII=" alt=""/><span class="'+xid_2+'-logo-span"vid=""sourcetype="yksmartbanner_player">'+_text1+'</span></div><div id="'+xid_2+'-btn"class="'+xid_2+'-btn">'+_text2+'</div></div></div>';
	add_css(_css);
	add_html(_html);
	document.querySelector("#"+xid_2+"-open").addEventListener("click", function() {
		location.href =  _link;
	}, false);
	document.querySelector("#"+xid_2+"-close").addEventListener("click", function() {
		var _c = document.querySelector("#"+xid);
		_c.parentNode.removeChild(_c);
	}, false);
}

function show_down() {
	var myos = mobileType();
	var _link = myos=='0' ? _link_ios : _link_android;
	var _css = '.vo-link{margin:20px 10px 0;border-radius:50px;text-align:center;line-height:40px;border:1px solid #ff5989}.share-txt{width:100%;height:40px;display:inline-block;color:#ff5989}';
	var _html = '<div class="vo-link" id="J_banner"><a class="share-txt" style="display:inline-block;">'+_text3+'</a></div>';
	add_css(_css);
	add_html(_html);
	document.querySelector("#J_banner").addEventListener("click", function() {
		location.href = _link;
	}, false);
}
function mobileType() {
	var u = navigator.userAgent,
		app = navigator.appVersion;
	if(/AppleWebKit.*Mobile/i.test(navigator.userAgent) || (/MIDP|SymbianOS|NOKIA|SAMSUNG|LG|NEC|TCL|Alcatel|BIRD|DBTEL|Dopod|PHILIPS|HAIER|LENOVO|MOT-|Nokia|SonyEricsson|SIE-|Amoi|ZTE/.test(navigator.userAgent))) {
		if(window.location.href.indexOf("?mobile") < 0) {
			try {
				if(/iPhone|mac|iPod|iPad/i.test(u)) {
					return '0';
				} else {
					return '1';
				}
			} catch(e) {}
		}
	} else if(/iPhone|mac|iPod|iPad/i.test(u)) {
		return '0';
	} else {
		return '1';
	}
}
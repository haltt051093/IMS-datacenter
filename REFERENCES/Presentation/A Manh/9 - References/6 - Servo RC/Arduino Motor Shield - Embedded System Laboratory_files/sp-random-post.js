/*!
Simplicy Random Post 1.5
by naxialis
*/


;(function() {
	function $(id) {
		return document.getElementById(id)
	}
	function addListener(e, n, o, u) {
		if(e.addEventListener) {
			e.addEventListener(n, o, u);
			return true;
		} else if(e.attachEvent) {
			e['e' + n + o] = o;
			e[n + o] = function() {
				e['e' + n + o](window.event);
			};
			e.attachEvent('on' + n, e[n + o]);
			return true;
		}
		return false;
	}
	function createxmlHttp() {
		var xmlHttp;
		try {
			xmlHttp = new XMLHttpRequest()
		} catch(e) {
			try {
				xmlHttp = new ActiveXObject("Microsoft.XMLHTTP")
			} catch(e) {
				try {
					xmlHttp = new ActiveXObject("Msxml2.XMLHTTP")
				} catch(e) {
					alert("Votre navigateur ne supporte pas ajax!");
					return false
				}
			}
		}
		return xmlHttp
	}
	function removeNode(obj){
		if(typeof obj == "string")$(obj).parentNode.removeChild($(obj));
		else obj.parentNode.removeChild(obj);
	}
	var baseurl="http://"+window.location.host+"/wp-content/",//get your blog url
		finds=document.getElementsByTagName('link'),timer;
	for(var i=0;i<finds.length;i++){
		if(finds[i].href.indexOf('wp-content')>0){
			baseurl=finds[i].href.substring(0,finds[i].href.indexOf('wp-content')+11);
			break;
		}
	}
	function get_random_posts(args){
		clearTimeout(timer);
		var url = '?action=SPrandompost&'+args;
        xmlHttp = createxmlHttp();
        xmlHttp.open("GET", url, true);
		xmlHttp.setRequestHeader("Content-type", "charset=UTF-8");
		if($('random-post-more')||0)
			$('random-post-more').innerHTML='<DIV style="background:url('+baseurl+'plugins/simplicy-random-post/img/loading.gif) left center no-repeat;padding-left:20px;'+')" class="ajax-loader">Loading...<p></p></DIV>';
		$('wp-random-posts').style.cursor = 'wait';
        xmlHttp.onreadystatechange = function() {
			if (xmlHttp.readyState == 4 || xmlHttp.readyState=="complete") {
                if (xmlHttp.status == 200) {//successed!
                    var data = xmlHttp.responseText;
					removeNode($('random-post-more'));
                    $('wp-random-posts').innerHTML=data;
					autoRefresh();
                } else {//error!
                    $('random-post-more').innerHTML='<p>Oops, failed to load data. <small><a href="javascript:void(0);" onclick="WARP_.get_random_posts('+args+');">[Reload]</a></small></p>';
                }
				$('wp-random-posts').style.cursor = 'auto';
            }
        };
        xmlHttp.send(null)
	}
	function autoRefresh(){
		if(!$('refreshTime'))return;
		var t=parseInt($('refreshTime').innerHTML);
		if(!t)$('random-post-more').getElementsByTagName('a')[0].onclick();
		else{
			$('refreshTime').innerHTML=--t;
			timer=setTimeout(function (){autoRefresh()},1000);
		}
	}
	addListener(window,'load',function(){
		autoRefresh();
	});
window.WARP_ = {};
window.WARP_['get_random_posts'] = get_random_posts;
})();
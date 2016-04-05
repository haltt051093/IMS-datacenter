/*
* @version		$Id: extravote.js 2008 vargas $ @package Joomla
*/
function JVXVote(id,i,total,total_count,xid,counter){
	var currentURL = window.location;
	var live_site = currentURL.protocol+'//'+currentURL.host+sfolder;
	var lsXmlHttp;
	
	var div = document.getElementById('extravote_'+id+'_'+xid);
	div.innerHTML='<img src="'+live_site+'/plugins/content/extravote/loading.gif" border="0" align="absmiddle" /> '+'<small>'+extravote_text[1]+'</small>';
	try	{
		lsXmlHttp=new XMLHttpRequest();
	} catch (e) {
		try	{ lsXmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e) {
			try { lsXmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
			} catch (e) {
				alert(extravote_text[0]);
				return false;
			}
		}
	}
	lsXmlHttp.onreadystatechange=function() {
		var response;
		if(lsXmlHttp.readyState==4){
			setTimeout(function(){ 
				response = lsXmlHttp.responseText; 
				if(response=='thanks') div.innerHTML='<small>'+extravote_text[2]+'</small>';
				if(response=='login') div.innerHTML='<small>'+extravote_text[3]+'</small>';
				if(response=='voted') div.innerHTML='<small>'+extravote_text[4]+'</small>';
			},500);
			setTimeout(function(){
				if(response=='thanks'){
					var newtotal = total_count+1;
					var percentage = ((total + i)/(newtotal));
					document.getElementById('rating_'+id+'_'+xid).style.width=parseInt(percentage*20)+'%';
				}
				if(counter!=0){
					if(response=='thanks'){
						if(newtotal!=1)	
							var newvotes=newtotal+' '+extravote_text[5];
						else
							var newvotes=newtotal+' '+extravote_text[6];
						div.innerHTML='<small>( '+newvotes+' )</small>';
					} else {
						if(total_count!=0 || counter!=-1) {
							if(total_count!=1)
								var votes=total_count+' '+extravote_text[5];
							else
								var votes=total_count+' '+extravote_text[6];
							div.innerHTML='<small>( '+votes+' )</small>';
						} else {
							div.innerHTML='';
						}
					}
				} else {
					div.innerHTML='';
				}
			},2000);
		}
	}
	lsXmlHttp.open("GET",live_site+"/plugins/content/extravote/ajax.php?task=vote&user_rating="+i+"&cid="+id+"&xid="+xid,true);
	lsXmlHttp.send(null);
}
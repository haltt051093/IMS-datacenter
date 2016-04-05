
/*------------------------------------------------------------------------
# JA Barite for Joomla 15 - Version 1.4 - Licence Owner JA130162
# ------------------------------------------------------------------------
# Copyright (C) 2004-2008 J.O.O.M Solutions Co., Ltd. All Rights Reserved.
# @license - Copyrighted Commercial Software
# Author: J.O.O.M Solutions Co., Ltd
# Websites:  http://www.joomlart.com -  http://www.joomlancers.com
# This file may not be redistributed in whole or significant part.
-------------------------------------------------------------------------*/

function switchFontSize (ckname,val){
	var bd = $E('BODY');
	switch (val) {
		case 'inc':
			if (CurrentFontSize+1 < 7) {
				bd.removeClass('fs'+CurrentFontSize);
				CurrentFontSize++;
				bd.addClass('fs'+CurrentFontSize);
			}		
		break;
		case 'dec':
			if (CurrentFontSize-1 > 0) {
				bd.removeClass('fs'+CurrentFontSize);
				CurrentFontSize--;
				bd.addClass('fs'+CurrentFontSize);
			}		
		break;
		default:
			bd.removeClass('fs'+CurrentFontSize);
			CurrentFontSize = val;
			bd.addClass('fs'+CurrentFontSize);		
	}
	Cookie.set(ckname, CurrentFontSize,{duration:365});
}

function switchTool (ckname, val) {
	createCookie(ckname, val, 365);
	window.location.reload();
}

function createCookie(name,value,days) {
  if (days) {
    var date = new Date();
    date.setTime(date.getTime()+(days*24*60*60*1000));
    var expires = "; expires="+date.toGMTString();
  }
  else expires = "";
  document.cookie = name+"="+value+expires+"; path=/";
}

String.prototype.trim = function() { return this.replace(/^\s+|\s+$/g, ""); };

function changeToolHilite(oldtool, newtool) {
	if (oldtool != newtool) {
		if (oldtool) {
			oldtool.src = oldtool.src.replace(/-hilite/,'');
		}
		newtool.src = newtool.src.replace(/.gif$/,'-hilite.gif');
	}
}

//addEvent - attach a function to an event
function jaAddEvent(obj, evType, fn){ 
 if (obj.addEventListener){ 
   obj.addEventListener(evType, fn, false); 
   return true; 
 } else if (obj.attachEvent){ 
   var r = obj.attachEvent("on"+evType, fn); 
   return r; 
 } else { 
   return false; 
 } 
}

function equalHeightInit (){

	//Content and wrap col
	var ja_content = $ ('ja-content');
	var ja_colwrap = $ ('ja-colwrap');
	if (ja_content && ja_colwrap) {
		//get bottom position
		var content_coor = ja_content.getCoordinates();
		var colwrap_inner = $E('.ja-innerpad', ja_colwrap);
		var colwrap_coor = colwrap_inner.getCoordinates();
		var offset = 10;
		if (content_coor.bottom > colwrap_coor.bottom)
		{
			//colwrap_inner.setStyle('height', colwrap_inner.getStyle('height').toInt() + content_coor.bottom - colwrap_coor.bottom);
			colwrap_inner.setStyle('height', content_coor.bottom - colwrap_coor.top - offset);
		} else {
			ja_content.setStyle('height', colwrap_coor.bottom - content_coor.top + offset);
		}
	}

	//Bottom spotlight 1
	var ja_botsl = $('ja-botsl');
	if (ja_botsl)
	{
		var botsl = getElementsByClass ("ja-box.*", ja_botsl, "DIV");	
		if (botsl && botsl.length)
		{
			var maxh = ja_botsl.getCoordinates().height - ja_botsl.getStyle('padding-top').toInt() - ja_botsl.getStyle('padding-bottom').toInt();

			for (var i=0; i<botsl.length ; ++i)
			{
				if ($(botsl[i]).getCoordinates().height < maxh)
				{
					var ja_inner = getLastWrapModDiv ($(botsl[i]));	
					if (ja_inner)
					{
						ja_inner.setStyle('height', maxh - 15);
					}
				}				
			}
		}
	}
}

function getLastWrapModDiv(mod) {
	while (mod.getFirst().tagName == 'DIV')
	{
		mod = mod.getFirst();
	}
	return mod;
}

function preloadImages () {
	var imgs = new Array();
	for (var i = 0; i < arguments.length; i++) {
		var imgsrc = arguments[i];
		imgs[i] = new Image();
		imgs[i].src = imgsrc;
	}
}

function getElementsByClass(searchClass,node,tag) {
	var classElements = new Array();
	var j = 0;
	if ( node == null )
		node = document;
	if ( tag == null )
		tag = '*';
	var els = node.getElementsByTagName(tag);
	var elsLen = els.length;
	var pattern = new RegExp('(^|\\s)'+searchClass+'(\\s|$)');
	for (var i = 0; i < elsLen; i++) {
		if ( pattern.test(els[i].className) ) {
			classElements[j] = els[i];
			j++;
		}
	}
	//alert(searchClass + j);
	return classElements;
}

function makeTransBg(el, bgimgdf, sizingMethod, type, offset){
	var objs = el;
	if(!objs) return;
	if ($type(objs) != 'array') objs = [objs];
	if(!sizingMethod) sizingMethod = 'crop';
	if(!offset) offset = 0;
	var blankimg = siteurl + 'images/blank.png';
	objs.each(function(obj) {
		var bgimg = bgimgdf;
		if (obj.tagName == 'IMG') {
			//This is an image
			if (!bgimg) bgimg = obj.src;
			if (!(/\.png$/i).test(bgimg) || (/blank\.png$/i).test(bgimg)) return;

			obj.setStyle('height',obj.offsetHeight);
			obj.setStyle('width',obj.offsetWidth);
			obj.src = blankimg;
			obj.setStyle ('visibility', 'visible');
			obj.setStyle('filter', "progid:DXImageTransform.Microsoft.AlphaImageLoader(src="+bgimg+", sizingMethod='"+sizingMethod+"')");
		}else{
			//Background
			if (!bgimg) bgimg = obj.getStyle('backgroundImage');
			var pattern = new RegExp('url\s*[\(\"\']*([^\'\"\)]*)[\'\"\)]*');
			if ((m = pattern.exec(bgimg))) bgimg = m[1];
			if (!(/\.png$/i).test(bgimg) || (/blank\.png$/i).test(bgimg)) return;
			if (!type)
			{
				obj.setStyle('background', 'none');
				//if(!obj.getStyle('position'))
				if(obj.getStyle('position')!='absolute' && obj.getStyle('position')!='relative') {
					obj.setStyle('position', 'relative');
				}

				//Get all child
				var childnodes = obj.childNodes;
				for(var j=0;j<childnodes.length;j++){
					if((child = $(childnodes[j]))) {
						if(child.getStyle('position')!='absolute' && child.getStyle('position')!='relative') {
							child.setStyle('position', 'relative');
						}
						child.setStyle('z-index',2);
					}
				}
				//Create background layer:
				var bgdiv = new Element('IMG');
				bgdiv.src = blankimg;
				bgdiv.width = obj.offsetWidth - offset;
				bgdiv.height = obj.offsetHeight - offset;
				bgdiv.setStyles({
					'position': 'absolute',
					'top': 0,
					'left': 0
				});

				bgdiv.className = 'TransBG';

				bgdiv.setStyle('filter', "progid:DXImageTransform.Microsoft.AlphaImageLoader(src="+bgimg+", sizingMethod='"+sizingMethod+"')");
				bgdiv.inject(obj, 'top');
				//alert(obj.innerHTML + '\n' + bgdiv.innerHTML);
			} else {
				obj.setStyle('filter', "progid:DXImageTransform.Microsoft.AlphaImageLoader(src="+bgimg+", sizingMethod='"+sizingMethod+"')");
			}
		}
	}.bind(this));
}

function isIE6() {
	version=0
	if (navigator.appVersion.indexOf("MSIE")!=-1){
		temp=navigator.appVersion.split("MSIE")
		version=parseFloat(temp[1])
	}
	return (version && (version < 7));
}

//Hack readon
function hackReadon () {
	var readons = getElementsByClass ("readon", null, "A");	
	if (!readons || !readons.length) return;
	for (var i=0; i<readons.length; i++)
	{
		var readon = readons[i];
		//Get readon parent (TR)
		var p = readon;
		while ((p = p.parentNode) && p.tagName != 'TR'){}
		if (!p) continue;
		var pc = p;
		while ((pc = pc.previousSibling) && pc.tagName != 'TR') {}
		if (!pc) continue;
		var tc = pc.firstChild;
		while (tc && tc.tagName!='TD') tc=tc.nextSibling;
		if (!tc) continue;
		tc.appendChild (readon);
		p.parentNode.removeChild(p);
		readon.style.display = 'block';
	}
}

//Add span to module title
function addSpanToTitle () {
  var colobj = document.getElementById ('bd');
  if (!colobj) return;
  var modules = getElementsByClass ('moduletable.*', colobj, "DIV");
 if (!modules) return;
  for (var i=0; i<modules.length; i++) {
    var module = modules[i];
    var title = module.getElementsByTagName ("h3")[0];  
    if (title) {
      title.innerHTML = "<span>"+title.innerHTML+"</span>";
      //module.className = "ja-" + module.className;
    }
  }
}

jaToolsHover = function() {
	var jautw = document.getElementById("ja-usertoolswrap");	
	if (!jautw) return;

	jautw.onmouseover=function() {
		this.className="ja-toolswraphover";
	}
	jautw.onmouseout=function() {
		this.className="";
	}
}

window.addEvent ('load', function() {
	hackReadon();
	addSpanToTitle();
	equalHeightInit();
	jaToolsHover ();
});
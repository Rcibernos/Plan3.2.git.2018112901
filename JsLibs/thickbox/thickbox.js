var tb_pathToImage="images/loadingAnimation.gif";
/*!!!!!!!!!!!!!!!! edit below this line at your own risk !!!!!!!!!!!!!!!!!!!!!!!*/
$(document).ready(function(){tb_init("a.thickbox, area.thickbox, input.thickbox");imgLoader=new Image();imgLoader.src=tb_pathToImage});function tb_init(a){$(a).click(function(){var d=this.title||this.name||null;var b=this.href||this.alt;var c=this.rel||false;tb_show(d,b,c);this.blur();return false})}function tb_show(b,h,d){try{if(typeof document.body.style.maxHeight==="undefined"){$("body","html").css({height:"100%",width:"100%"});$("html").css("overflow","hidden");if(document.getElementById("TB_HideSelect")===null){$("body").append("<iframe id='TB_HideSelect'></iframe><div id='TB_overlay'></div><div id='TB_window'></div>");$("#TB_overlay").click(tb_remove)}}else{if(document.getElementById("TB_overlay")===null){$("body").append("<div id='TB_overlay'></div><div id='TB_window'></div>");$("#TB_overlay").click(tb_remove)}}if(tb_detectMacXFF()){$("#TB_overlay").addClass("TB_overlayMacFFBGHack")}else{$("#TB_overlay").addClass("TB_overlayBG")}if(b===null){b=""}$("body").append("<div id='TB_load'><img src='"+imgLoader.src+"' /></div>");$("#TB_load").show();var a;if(h.indexOf("?")!==-1){a=h.substr(0,h.indexOf("?"))}else{a=h}var i=/\.jpg$|\.jpeg$|\.png$|\.gif$|\.bmp$/;var j=a.toLowerCase().match(i);if(j==".jpg"||j==".jpeg"||j==".png"||j==".gif"||j==".bmp"){TB_PrevCaption="";TB_PrevURL="";TB_PrevHTML="";TB_NextCaption="";TB_NextURL="";TB_NextHTML="";TB_imageCount="";TB_FoundURL=false;if(d){TB_TempArray=$("a[@rel="+d+"]").get();for(TB_Counter=0;((TB_Counter<TB_TempArray.length)&&(TB_NextHTML===""));TB_Counter++){var k=TB_TempArray[TB_Counter].href.toLowerCase().match(i);if(!(TB_TempArray[TB_Counter].href==h)){if(TB_FoundURL){TB_NextCaption=TB_TempArray[TB_Counter].title;TB_NextURL=TB_TempArray[TB_Counter].href;TB_NextHTML="<span id='TB_next'>&nbsp;&nbsp;<a href='#'>Next &gt;</a></span>"}else{TB_PrevCaption=TB_TempArray[TB_Counter].title;TB_PrevURL=TB_TempArray[TB_Counter].href;TB_PrevHTML="<span id='TB_prev'>&nbsp;&nbsp;<a href='#'>&lt; Prev</a></span>"}}else{TB_FoundURL=true;TB_imageCount="Image "+(TB_Counter+1)+" of "+(TB_TempArray.length)}}}imgPreloader=new Image();imgPreloader.onload=function(){imgPreloader.onload=null;var o=tb_getPageSize();var p=o[0]-150;var q=o[1]-150;var n=imgPreloader.width;var m=imgPreloader.height;if(n>p){m=m*(p/n);n=p;if(m>q){n=n*(q/m);m=q}}else{if(m>q){n=n*(q/m);m=q;if(n>p){m=m*(p/n);n=p}}}TB_WIDTH=n+30;TB_HEIGHT=m+60;$("#TB_window").append("<a href='' id='TB_ImageOff' title='Close'><img id='TB_Image' src='"+h+"' width='"+n+"' height='"+m+"' alt='"+b+"'/></a><div id='TB_caption'>"+b+"<div id='TB_secondLine'>"+TB_imageCount+TB_PrevHTML+TB_NextHTML+"</div></div><div id='TB_closeWindow'><a href='#' id='TB_closeWindowButton' title='Close'>close</a> or Esc Key</div>");$("#TB_closeWindowButton").click(tb_remove);if(!(TB_PrevHTML==="")){function l(){if($(document).unbind("click",l)){$(document).unbind("click",l)}$("#TB_window").remove();$("body").append("<div id='TB_window'></div>");tb_show(TB_PrevCaption,TB_PrevURL,d);return false}$("#TB_prev").click(l)}if(!(TB_NextHTML==="")){function e(){$("#TB_window").remove();$("body").append("<div id='TB_window'></div>");tb_show(TB_NextCaption,TB_NextURL,d);return false}$("#TB_next").click(e)}document.onkeydown=function(r){if(r==null){keycode=event.keyCode}else{keycode=r.which}if(keycode==27){tb_remove()}else{if(keycode==190){if(!(TB_NextHTML=="")){document.onkeydown="";e()}}else{if(keycode==188){if(!(TB_PrevHTML=="")){document.onkeydown="";l()}}}}};tb_position();$("#TB_load").remove();$("#TB_ImageOff").click(tb_remove);$("#TB_window").css({display:"block"})};imgPreloader.src=h}else{var g=h.replace(/^[^\?]+\??/,"");var f=tb_parseQuery(g);TB_WIDTH=(f.width*1)+30||630;TB_HEIGHT=(f.height*1)+40||440;ajaxContentW=TB_WIDTH-30;ajaxContentH=TB_HEIGHT-45;if(h.indexOf("TB_iframe")!=-1){urlNoQuery=h.split("TB_");$("#TB_iframeContent").remove();if(f.modal!="true"){$("#TB_window").append("<div id='TB_title'><div id='TB_ajaxWindowTitle'>"+b+"</div><div id='TB_closeAjaxWindow'><a href='#' id='TB_closeWindowButton' title='Close'>close</a> or Esc Key</div></div><iframe frameborder='0' hspace='0' src='"+urlNoQuery[0]+"' id='TB_iframeContent' name='TB_iframeContent"+Math.round(Math.random()*1000)+"' onload='tb_showIframe()' style='width:"+(ajaxContentW+29)+"px;height:"+(ajaxContentH+17)+"px;' > </iframe>")}else{$("#TB_overlay").unbind();$("#TB_window").append("<iframe frameborder='0' hspace='0' src='"+urlNoQuery[0]+"' id='TB_iframeContent' name='TB_iframeContent"+Math.round(Math.random()*1000)+"' onload='tb_showIframe()' style='width:"+(ajaxContentW+29)+"px;height:"+(ajaxContentH+17)+"px;'> </iframe>")}}else{if($("#TB_window").css("display")!="block"){if(f.modal!="true"){$("#TB_window").append("<div id='TB_title'><div id='TB_ajaxWindowTitle'>"+b+"</div><div id='TB_closeAjaxWindow'><a href='#' id='TB_closeWindowButton'>close</a> or Esc Key</div></div><div id='TB_ajaxContent' style='width:"+ajaxContentW+"px;height:"+ajaxContentH+"px'></div>")}else{$("#TB_overlay").unbind();$("#TB_window").append("<div id='TB_ajaxContent' class='TB_modal' style='width:"+ajaxContentW+"px;height:"+ajaxContentH+"px;'></div>")}}else{$("#TB_ajaxContent")[0].style.width=ajaxContentW+"px";$("#TB_ajaxContent")[0].style.height=ajaxContentH+"px";$("#TB_ajaxContent")[0].scrollTop=0;$("#TB_ajaxWindowTitle").html(b)}}$("#TB_closeWindowButton").click(tb_remove);if(h.indexOf("TB_inline")!=-1){$("#TB_ajaxContent").append($("#"+f.inlineId).children());$("#TB_window").unload(function(){$("#"+f.inlineId).append($("#TB_ajaxContent").children())});tb_position();$("#TB_load").remove();$("#TB_window").css({display:"block"})}else{if(h.indexOf("TB_iframe")!=-1){tb_position();if($.browser.safari){$("#TB_load").remove();$("#TB_window").css({display:"block"})}}else{$("#TB_ajaxContent").load(h+="&random="+(new Date().getTime()),function(){tb_position();$("#TB_load").remove();tb_init("#TB_ajaxContent a.thickbox");$("#TB_window").css({display:"block"})})}}}if(!f.modal){document.onkeyup=function(l){if(l==null){keycode=event.keyCode}else{keycode=l.which}if(keycode==27){tb_remove()}}}}catch(c){}}function tb_showIframe(){$("#TB_load").remove();$("#TB_window").css({display:"block"})}function tb_remove(){$("#TB_imageOff").unbind("click");$("#TB_closeWindowButton").unbind("click");$("#TB_window").fadeOut("fast",function(){$("#TB_window,#TB_overlay,#TB_HideSelect").trigger("unload").unbind().remove()});$("#TB_load").remove();if(typeof document.body.style.maxHeight=="undefined"){$("body","html").css({height:"auto",width:"auto"});$("html").css("overflow","")}document.onkeydown="";document.onkeyup="";return false}function tb_position(){$("#TB_window").css({marginLeft:"-"+parseInt((TB_WIDTH/2),10)+"px",width:TB_WIDTH+"px"});if(!(jQuery.browser.msie&&jQuery.browser.version<7)){$("#TB_window").css({marginTop:"-"+parseInt((TB_HEIGHT/2),10)+"px"})}}function tb_parseQuery(f){var e={};if(!f){return e}var d=f.split(/[;&]/);for(var a=0;a<d.length;a++){var c=d[a].split("=");if(!c||c.length!=2){continue}var b=unescape(c[0]);var g=unescape(c[1]);g=g.replace(/\+/g," ");e[b]=g}return e}function tb_getPageSize(){var a=document.documentElement;var c=window.innerWidth||self.innerWidth||(a&&a.clientWidth)||document.body.clientWidth;var b=window.innerHeight||self.innerHeight||(a&&a.clientHeight)||document.body.clientHeight;arrayPageSize=[c,b];return arrayPageSize}function tb_detectMacXFF(){var a=navigator.userAgent.toLowerCase();if(a.indexOf("mac")!=-1&&a.indexOf("firefox")!=-1){return true}};
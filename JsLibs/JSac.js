var oldAlert=alert;var defColumnClassAlert=" col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2 col-xs-10 col-xs-offset-1 PWDialogBox ";var defColumnClassConfirm=" col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1 PWDialogBox confirm ";alert=function(a,c,b){if(!c){c=""}if(!b){b="info"}a=preventScriptInyection(""+a);if((!a||a=="")&&(!c||c=="")){return}$.confirm({title:false,keyboardEnabled:true,content:a,closeIcon:true,confirmButton:false,cancelButton:false,backgroundDismiss:true,theme:"material",columnClass:defColumnClassAlert+b})};ShowPantallaMensaje=function(a,d,b,c){if(!c){c=3000}if(!d){d=""}if(!b){b="info"}if((!a||a=="")&&(!d||d=="")){return}a=preventScriptInyection(""+a);$.confirm({title:false,keyboardEnabled:true,content:a,closeIcon:true,confirmButton:false,cancelButtonClass:"PWDisplayNone",autoClose:"cancel|"+c,backgroundDismiss:true,theme:"material",columnClass:defColumnClassAlert+b,cancel:function(){}})};showInfo=function(a,b){alert(a,b," info ")};showWarning=function(a,b){alert(a,b," warning ")};showError=function(a,b){alert(a,b," error ")};showOk=function(a,b){ShowPantallaMensaje(a,b," ok ",4000)};confirmAndGoXEval=function(mensaje,title,txtOk,txtCncl,mode,ifOk,ifCncl){if(!txtOk||txtOk==""){txtOk="Aceptar"}if(!txtCncl||txtCncl==""){txtCncl="Cancelar"}if(!mode){mode=""}if(!mensaje||mensaje==""){if(ifOk){eval(ifOk)}return true}else{mensaje=preventScriptInyection(""+mensaje);$.confirm({title:(title?preventScriptInyection(title):false),closeIcon:false,keyboardEnabled:true,content:mensaje,theme:"material",columnClass:defColumnClassConfirm+mode,confirmButton:txtOk,cancelButton:txtCncl,confirmButtonClass:" PWButton ok ",cancelButtonClass:" PWButton cancel ",confirm:(ifOk?function(){eval(ifOk)}:function(){}),cancel:(ifCncl?function(){eval(ifCncl)}:function(){})})}};preventScriptInyection=function(a){if(!a){return a}if(a.toLowerCase().indexOf("script")!==-1){return a.replace(/\</g," ").replace(/\>/g," ")}a=a.trim();while(a.indexOf("\n\n")>=0){a=a.split("\n\n").join("\n")}a=a.split("\n").join("<br/>");a=a.split("__________________________________________").join("<hr/>");while(a.indexOf("<br/><hr/>")>=0){a=a.split("<br/><hr/>").join("<hr/>")}while(a.indexOf("<hr/><br/>")>=0){a=a.split("<hr/><br/>").join("<hr/>")}while(a.indexOf("<hr/><hr/>")>=0){a=a.split("<hr/><hr/>").join("<hr/>")}if(a.match("^/<hr/>")){a=a.substr(5,a.length-5)}if(a.match("<hr/>$")){a=a.substr(0,a.length-5)}return a};confirmAndGoXId=function(c,e,g,f,d,b,a){return confirmAndGoXEval(c,e,g,f,d,(b?'$("#'+b+'").click()':null),(a?"$(#"+a+").click()":null))};ConfirmarCambiosAntesDeEjecutarXEval=function(IdIndicadorCambios,mensaje,title,txtOk,txtCncl,mode,ifConfirm,ifCancel,WaitScEEn){if(!mensaje){mensaje="Si cierra sin guardar los cambios se perderán"}AuxIDC=document.getElementById(IdIndicadorCambios);if(AuxIDC){if(AuxIDC.value!=""&&AuxIDC.value!=null&&AuxIDC.value!="0"){confirmAndGoXEval(mensaje,title,txtOk,txtCncl,mode,ifConfirm,ifCancel);return}}if(WaitScEEn){PantallaEnEspera("")}eval(ifConfirm)};ConfirmarCambiosAntesDeEjecutarXId=function(c,d,f,h,g,e,b,a,i){return ConfirmarCambiosAntesDeEjecutarXEval(c,d,f,h,g,e,(b?'$("#'+b+'").click()':null),(a?"$(#"+a+").click()":null),i)};if(!window.btoa){var Base64={_keyStr:"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=",encode:function(j){var k="";var a,b,c,d,e,f,g;var h=0;j=Base64._utf8_encode(j);while(h<j.length){a=j.charCodeAt(h++);b=j.charCodeAt(h++);c=j.charCodeAt(h++);d=a>>2;e=((a&3)<<4)|(b>>4);f=((b&15)<<2)|(c>>6);g=c&63;if(isNaN(b)){f=g=64}else{if(isNaN(c)){g=64}}k=k+this._keyStr.charAt(d)+this._keyStr.charAt(e)+this._keyStr.charAt(f)+this._keyStr.charAt(g)}return k},decode:function(j){var k="";var a,b,c;var d,e,f,g;var h=0;j=j.replace(/[^A-Za-z0-9\+\/\=]/g,"");while(h<j.length){d=this._keyStr.indexOf(j.charAt(h++));e=this._keyStr.indexOf(j.charAt(h++));f=this._keyStr.indexOf(j.charAt(h++));g=this._keyStr.indexOf(j.charAt(h++));a=(d<<2)|(e>>4);b=((e&15)<<4)|(f>>2);c=((f&3)<<6)|g;k=k+String.fromCharCode(a);if(f!=64){k=k+String.fromCharCode(b)}if(g!=64){k=k+String.fromCharCode(c)}}k=Base64._utf8_decode(k);return k},_utf8_encode:function(d){d=d.replace(/\r\n/g,"\n");var e="";for(var b=0;b<d.length;b++){var a=d.charCodeAt(b);if(a<128){e+=String.fromCharCode(a)}else{if((a>127)&&(a<2048)){e+=String.fromCharCode((a>>6)|192);e+=String.fromCharCode((a&63)|128)}else{e+=String.fromCharCode((a>>12)|224);e+=String.fromCharCode(((a>>6)&63)|128);e+=String.fromCharCode((a&63)|128)}}}return e},_utf8_decode:function(e){var d="";var b=0;var a=c1=c2=0;while(b<e.length){a=e.charCodeAt(b);if(a<128){d+=String.fromCharCode(a);b++}else{if((a>191)&&(a<224)){c2=e.charCodeAt(b+1);d+=String.fromCharCode(((a&31)<<6)|(c2&63));b+=2}else{c2=e.charCodeAt(b+1);c3=e.charCodeAt(b+2);d+=String.fromCharCode(((a&15)<<12)|((c2&63)<<6)|(c3&63));b+=3}}}return d}};window.btoa=Base64.encode;window.atob=Base64.decode};
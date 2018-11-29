define("ace/ext/static_highlight",["require","exports","module","ace/edit_session","ace/layer/text","ace/config","ace/lib/dom"],function(h,e,g){var d=h("../edit_session").EditSession;var j=h("../layer/text").Text;var a=".ace_static_highlight {font-family: 'Monaco', 'Menlo', 'Ubuntu Mono', 'Consolas', 'source-code-pro', 'Droid Sans Mono', monospace;font-size: 12px;white-space: pre-wrap}.ace_static_highlight .ace_gutter {width: 2em;text-align: right;padding: 0 3px 0 0;margin-right: 3px;}.ace_static_highlight.ace_show_gutter .ace_line {padding-left: 2.6em;}.ace_static_highlight .ace_line { position: relative; }.ace_static_highlight .ace_gutter-cell {-moz-user-select: -moz-none;-khtml-user-select: none;-webkit-user-select: none;user-select: none;top: 0;bottom: 0;left: 0;position: absolute;}.ace_static_highlight .ace_gutter-cell:before {content: counter(ace_line, decimal);counter-increment: ace_line;}.ace_static_highlight {counter-reset: ace_line;}";var b=h("../config");var c=h("../lib/dom");var i=function(){this.config={}};i.prototype=j.prototype;var f=function(o,t,k){var q=o.className.match(/lang-(\w+)/);var r=t.mode||q&&("ace/mode/"+q[1]);if(!r){return false}var v=t.theme||"ace/theme/textmate";var n="";var s=[];if(o.firstElementChild){var u=0;for(var p=0;p<o.childNodes.length;p++){var l=o.childNodes[p];if(l.nodeType==3){u+=l.data.length;n+=l.data}else{s.push(u,l)}}}else{n=c.getInnerText(o);if(t.trim){n=n.trim()}}f.render(n,r,v,t.firstLineNumber,!t.showGutter,function(w){c.importCssString(w.css,"ace_highlight");o.innerHTML=w.html;var m=o.firstChild.firstChild;for(var x=0;x<s.length;x+=2){var A=w.session.doc.indexToPosition(s[x]);var z=s[x+1];var y=m.children[A.row];y&&y.appendChild(z)}k&&k()})};f.render=function(n,p,s,o,l,k){var t=1;var q=d.prototype.$modes;if(typeof s=="string"){t++;b.loadModule(["theme",s],function(u){s=u;--t||m()})}var r;if(p&&typeof p==="object"&&!p.getTokenizer){r=p;p=r.path}if(typeof p=="string"){t++;b.loadModule(["mode",p],function(u){if(!q[p]||r){q[p]=new u.Mode(r)}p=q[p];--t||m()})}function m(){var u=f.renderSync(n,p,s,o,l);return k?k(u):u}return --t||m()};f.renderSync=function(m,q,u,p,k){p=parseInt(p||1,10);var r=new d("");r.setUseWorker(false);r.setMode(q);var t=new i();t.setSession(r);r.setValue(m);var s=[];var o=r.getLength();for(var n=0;n<o;n++){s.push("<div class='ace_line'>");if(!k){s.push("<span class='ace_gutter ace_gutter-cell' unselectable='on'></span>")}t.$renderLine(s,n,true,false);s.push("\n</div>")}var l="<div class='"+u.cssClass+"'><div class='ace_static_highlight"+(k?"":" ace_show_gutter")+"' style='counter-reset:ace_line "+(p-1)+"'>"+s.join("")+"</div></div>";t.destroy();return{css:a+u.cssText,html:l,session:r}};g.exports=f;g.exports.highlight=f});(function(){window.require(["ace/ext/static_highlight"],function(){})})();
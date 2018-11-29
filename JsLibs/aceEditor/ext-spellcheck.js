define("ace/ext/spellcheck",["require","exports","module","ace/lib/event","ace/editor","ace/config"],function(e,c,d){var b=e("../lib/event");c.contextMenuHandler=function(h){var i=h.target;var m=i.textInput.getElement();if(!i.selection.isEmpty()){return}var g=i.getCursorPosition();var l=i.session.getWordRange(g.row,g.column);var o=i.session.getTextRange(l);i.session.tokenRe.lastIndex=0;if(!i.session.tokenRe.test(o)){return}var k="\x01\x01";var n=o+" "+k;m.value=n;m.setSelectionRange(o.length,o.length+1);m.setSelectionRange(0,0);m.setSelectionRange(0,o.length);var f=false;b.addListener(m,"keydown",function j(){b.removeListener(m,"keydown",j);f=true});i.textInput.setInputHandler(function(p){console.log(p,n,m.selectionStart,m.selectionEnd);if(p==n){return""}if(p.lastIndexOf(n,0)===0){return p.slice(n.length)}if(p.substr(m.selectionEnd)==n){return p.slice(0,-n.length)}if(p.slice(-2)==k){var q=p.slice(0,-2);if(q.slice(-1)==" "){if(f){return q.substring(0,m.selectionEnd)}q=q.slice(0,-1);i.session.replace(l,q);return""}}return p})};var a=e("../editor").Editor;e("../config").defineOptions(a.prototype,"editor",{spellcheck:{set:function(g){var f=this.textInput.getElement();f.spellcheck=!!g;if(!g){this.removeListener("nativecontextmenu",c.contextMenuHandler)}else{this.on("nativecontextmenu",c.contextMenuHandler)}},value:true}})});(function(){window.require(["ace/ext/spellcheck"],function(){})})();
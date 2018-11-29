define("ace/ext/linking",["require","exports","module","ace/editor","ace/config"],function(f,b,c){var a=f("ace/editor").Editor;f("../config").defineOptions(a.prototype,"editor",{enableLinking:{set:function(g){if(g){this.on("click",d);this.on("mousemove",e)}else{this.off("click",d);this.off("mousemove",e)}},value:false}});b.previousLinkingHover=false;function e(i){var j=i.editor;var g=i.getAccelKey();if(g){var j=i.editor;var h=i.getDocumentPosition();var k=j.session;var l=k.getTokenAt(h.row,h.column);if(b.previousLinkingHover&&b.previousLinkingHover!=l){j._emit("linkHoverOut")}j._emit("linkHover",{position:h,token:l});b.previousLinkingHover=l}else{if(b.previousLinkingHover){j._emit("linkHoverOut");b.previousLinkingHover=false}}}function d(j){var h=j.getAccelKey();var g=j.getButton();if(g==0&&h){var k=j.editor;var i=j.getDocumentPosition();var l=k.session;var m=l.getTokenAt(i.row,i.column);k._emit("linkClick",{position:i,token:m})}}});(function(){window.require(["ace/ext/linking"],function(){})})();
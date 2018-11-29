define("ace/mode/graphqlschema_highlight_rules",["require","exports","module","ace/lib/oop","ace/mode/text_highlight_rules"],function(e,a,c){var d=e("../lib/oop");var f=e("./text_highlight_rules").TextHighlightRules;var b=function(){var i=("type|interface|union|enum|schema|input|implements|extends|scalar");var g=("Int|Float|String|ID|Boolean");var h=this.createKeywordMapper({keyword:i,"storage.type":g},"identifier");this.$rules={start:[{token:"comment",regex:"#.*$"},{token:"paren.lparen",regex:/[\[({]/,next:"start"},{token:"paren.rparen",regex:/[\])}]/},{token:h,regex:"[a-zA-Z_$][a-zA-Z0-9_$]*\\b"}]};this.normalizeRules()};d.inherits(b,f);a.GraphQLSchemaHighlightRules=b});define("ace/mode/folding/cstyle",["require","exports","module","ace/lib/oop","ace/range","ace/mode/folding/fold_mode"],function(g,b,d){var e=g("../../lib/oop");var f=g("../../range").Range;var a=g("./fold_mode").FoldMode;var c=b.FoldMode=function(h){if(h){this.foldingStartMarker=new RegExp(this.foldingStartMarker.source.replace(/\|[^|]*?$/,"|"+h.start));this.foldingStopMarker=new RegExp(this.foldingStopMarker.source.replace(/\|[^|]*?$/,"|"+h.end))}};e.inherits(c,a);(function(){this.foldingStartMarker=/(\{|\[)[^\}\]]*$|^\s*(\/\*)/;this.foldingStopMarker=/^[^\[\{]*(\}|\])|^[\s\*]*(\*\/)/;this.singleLineBlockCommentRe=/^\s*(\/\*).*\*\/\s*$/;this.tripleStarBlockCommentRe=/^\s*(\/\*\*\*).*\*\/\s*$/;this.startRegionRe=/^\s*(\/\*|\/\/)#?region\b/;this._getFoldWidgetBase=this.getFoldWidget;this.getFoldWidget=function(l,h,k){var j=l.getLine(k);if(this.singleLineBlockCommentRe.test(j)){if(!this.startRegionRe.test(j)&&!this.tripleStarBlockCommentRe.test(j)){return""}}var i=this._getFoldWidgetBase(l,h,k);if(!i&&this.startRegionRe.test(j)){return"start"}return i};this.getFoldWidgetRange=function(p,h,o,j){var l=p.getLine(o);if(this.startRegionRe.test(l)){return this.getCommentRegionBlock(p,l,o)}var m=l.match(this.foldingStartMarker);if(m){var k=m.index;if(m[1]){return this.openingBracketBlock(p,m[1],o,k)}var n=p.getCommentFoldRange(o,k+m[0].length,1);if(n&&!n.isMultiLine()){if(j){n=this.getSectionRange(p,o)}else{if(h!="all"){n=null}}}return n}if(h==="markbegin"){return}var m=l.match(this.foldingStopMarker);if(m){var k=m.index+m[0].length;if(m[1]){return this.closingBracketBlock(p,m[1],o,k)}return p.getCommentFoldRange(o,k,-1)}};this.getSectionRange=function(m,l){var j=m.getLine(l);var o=j.search(/\S/);var p=l;var n=j.length;l=l+1;var h=l;var k=m.getLength();while(++l<k){j=m.getLine(l);var i=j.search(/\S/);if(i===-1){continue}if(o>i){break}var q=this.getFoldWidgetRange(m,"all",l);if(q){if(q.start.row<=p){break}else{if(q.isMultiLine()){l=q.end.row}else{if(o==i){break}}}}h=l}return new f(p,n,h,m.getLine(h).length)};this.getCommentRegionBlock=function(p,j,o){var q=j.search(/\s*$/);var l=p.getLength();var r=o;var n=/^\s*(?:\/\*|\/\/|--)#?(end)?region\b/;var h=1;while(++o<l){j=p.getLine(o);var k=n.exec(j);if(!k){continue}if(k[1]){h--}else{h++}if(!h){break}}var i=o;if(i>r){return new f(r,q,i,j.length)}}}).call(c.prototype)});define("ace/mode/graphqlschema",["require","exports","module","ace/lib/oop","ace/mode/text","ace/mode/graphqlschema_highlight_rules","ace/mode/folding/cstyle"],function(g,a,e){var f=g("../lib/oop");var h=g("./text").Mode;var c=g("./graphqlschema_highlight_rules").GraphQLSchemaHighlightRules;var b=g("./folding/cstyle").FoldMode;var d=function(){this.HighlightRules=c;this.foldingRules=new b()};f.inherits(d,h);(function(){this.lineCommentStart="#";this.$id="ace/mode/graphqlschema"}).call(d.prototype);a.Mode=d});
define("ace/mode/doc_comment_highlight_rules",["require","exports","module","ace/lib/oop","ace/mode/text_highlight_rules"],function(e,b,c){var d=e("../lib/oop");var f=e("./text_highlight_rules").TextHighlightRules;var a=function(){this.$rules={start:[{token:"comment.doc.tag",regex:"@[\\w\\d_]+"},a.getTagRule(),{defaultToken:"comment.doc",caseInsensitive:true}]}};d.inherits(a,f);a.getTagRule=function(g){return{token:"comment.doc.tag.storage.type",regex:"\\b(?:TODO|FIXME|XXX|HACK)\\b"}};a.getStartRule=function(g){return{token:"comment.doc",regex:"\\/\\*(?=\\*)",next:g}};a.getEndRule=function(g){return{token:"comment.doc",regex:"\\*\\/",next:g}};b.DocCommentHighlightRules=a});define("ace/mode/csharp_highlight_rules",["require","exports","module","ace/lib/oop","ace/mode/doc_comment_highlight_rules","ace/mode/text_highlight_rules"],function(f,c,d){var e=f("../lib/oop");var b=f("./doc_comment_highlight_rules").DocCommentHighlightRules;var g=f("./text_highlight_rules").TextHighlightRules;var a=function(){var h=this.createKeywordMapper({"variable.language":"this",keyword:"abstract|event|new|struct|as|explicit|null|switch|base|extern|object|this|bool|false|operator|throw|break|finally|out|true|byte|fixed|override|try|case|float|params|typeof|catch|for|private|uint|char|foreach|protected|ulong|checked|goto|public|unchecked|class|if|readonly|unsafe|const|implicit|ref|ushort|continue|in|return|using|decimal|int|sbyte|virtual|default|interface|sealed|volatile|delegate|internal|short|void|do|is|sizeof|while|double|lock|stackalloc|else|long|static|enum|namespace|string|var|dynamic","constant.language":"null|true|false"},"identifier");this.$rules={start:[{token:"comment",regex:"\\/\\/.*$"},b.getStartRule("doc-start"),{token:"comment",regex:"\\/\\*",next:"comment"},{token:"string",regex:/'(?:.|\\(:?u[\da-fA-F]+|x[\da-fA-F]+|[tbrf'"n]))?'/},{token:"string",start:'"',end:'"|$',next:[{token:"constant.language.escape",regex:/\\(:?u[\da-fA-F]+|x[\da-fA-F]+|[tbrf'"n])/},{token:"invalid",regex:/\\./}]},{token:"string",start:'@"',end:'"',next:[{token:"constant.language.escape",regex:'""'}]},{token:"string",start:/\$"/,end:'"|$',next:[{token:"constant.language.escape",regex:/\\(:?$)|{{/},{token:"constant.language.escape",regex:/\\(:?u[\da-fA-F]+|x[\da-fA-F]+|[tbrf'"n])/},{token:"invalid",regex:/\\./}]},{token:"constant.numeric",regex:"0[xX][0-9a-fA-F]+\\b"},{token:"constant.numeric",regex:"[+-]?\\d+(?:(?:\\.\\d*)?(?:[eE][+-]?\\d+)?)?\\b"},{token:"constant.language.boolean",regex:"(?:true|false)\\b"},{token:h,regex:"[a-zA-Z_$][a-zA-Z0-9_$]*\\b"},{token:"keyword.operator",regex:"!|\\$|%|&|\\*|\\-\\-|\\-|\\+\\+|\\+|~|===|==|=|!=|!==|<=|>=|<<=|>>=|>>>=|<>|<|>|!|&&|\\|\\||\\?\\:|\\*=|%=|\\+=|\\-=|&=|\\^=|\\b(?:in|instanceof|new|delete|typeof|void)"},{token:"keyword",regex:"^\\s*#(if|else|elif|endif|define|undef|warning|error|line|region|endregion|pragma)"},{token:"punctuation.operator",regex:"\\?|\\:|\\,|\\;|\\."},{token:"paren.lparen",regex:"[[({]"},{token:"paren.rparen",regex:"[\\])}]"},{token:"text",regex:"\\s+"}],comment:[{token:"comment",regex:"\\*\\/",next:"start"},{defaultToken:"comment"}]};this.embedRules(b,"doc-",[b.getEndRule("start")]);this.normalizeRules()};e.inherits(a,g);c.CSharpHighlightRules=a});define("ace/mode/matching_brace_outdent",["require","exports","module","ace/range"],function(e,a,c){var d=e("../range").Range;var b=function(){};(function(){this.checkOutdent=function(g,f){if(!/^\s+$/.test(g)){return false}return/^\s*\}/.test(f)};this.autoOutdent=function(g,l){var i=g.getLine(l);var j=i.match(/^(\s*\})/);if(!j){return 0}var f=j[1].length;var k=g.findMatchingBracket({row:l,column:f});if(!k||k.row==l){return 0}var h=this.$getIndent(g.getLine(k.row));g.replace(new d(l,0,l,f-1),h)};this.$getIndent=function(f){return f.match(/^\s*/)[0]}}).call(b.prototype);a.MatchingBraceOutdent=b});define("ace/mode/folding/cstyle",["require","exports","module","ace/lib/oop","ace/range","ace/mode/folding/fold_mode"],function(g,b,d){var e=g("../../lib/oop");var f=g("../../range").Range;var a=g("./fold_mode").FoldMode;var c=b.FoldMode=function(h){if(h){this.foldingStartMarker=new RegExp(this.foldingStartMarker.source.replace(/\|[^|]*?$/,"|"+h.start));this.foldingStopMarker=new RegExp(this.foldingStopMarker.source.replace(/\|[^|]*?$/,"|"+h.end))}};e.inherits(c,a);(function(){this.foldingStartMarker=/(\{|\[)[^\}\]]*$|^\s*(\/\*)/;this.foldingStopMarker=/^[^\[\{]*(\}|\])|^[\s\*]*(\*\/)/;this.singleLineBlockCommentRe=/^\s*(\/\*).*\*\/\s*$/;this.tripleStarBlockCommentRe=/^\s*(\/\*\*\*).*\*\/\s*$/;this.startRegionRe=/^\s*(\/\*|\/\/)#?region\b/;this._getFoldWidgetBase=this.getFoldWidget;this.getFoldWidget=function(l,h,k){var j=l.getLine(k);if(this.singleLineBlockCommentRe.test(j)){if(!this.startRegionRe.test(j)&&!this.tripleStarBlockCommentRe.test(j)){return""}}var i=this._getFoldWidgetBase(l,h,k);if(!i&&this.startRegionRe.test(j)){return"start"}return i};this.getFoldWidgetRange=function(p,h,o,j){var l=p.getLine(o);if(this.startRegionRe.test(l)){return this.getCommentRegionBlock(p,l,o)}var m=l.match(this.foldingStartMarker);if(m){var k=m.index;if(m[1]){return this.openingBracketBlock(p,m[1],o,k)}var n=p.getCommentFoldRange(o,k+m[0].length,1);if(n&&!n.isMultiLine()){if(j){n=this.getSectionRange(p,o)}else{if(h!="all"){n=null}}}return n}if(h==="markbegin"){return}var m=l.match(this.foldingStopMarker);if(m){var k=m.index+m[0].length;if(m[1]){return this.closingBracketBlock(p,m[1],o,k)}return p.getCommentFoldRange(o,k,-1)}};this.getSectionRange=function(m,l){var j=m.getLine(l);var o=j.search(/\S/);var p=l;var n=j.length;l=l+1;var h=l;var k=m.getLength();while(++l<k){j=m.getLine(l);var i=j.search(/\S/);if(i===-1){continue}if(o>i){break}var q=this.getFoldWidgetRange(m,"all",l);if(q){if(q.start.row<=p){break}else{if(q.isMultiLine()){l=q.end.row}else{if(o==i){break}}}}h=l}return new f(p,n,h,m.getLine(h).length)};this.getCommentRegionBlock=function(p,j,o){var q=j.search(/\s*$/);var l=p.getLength();var r=o;var n=/^\s*(?:\/\*|\/\/|--)#?(end)?region\b/;var h=1;while(++o<l){j=p.getLine(o);var k=n.exec(j);if(!k){continue}if(k[1]){h--}else{h++}if(!h){break}}var i=o;if(i>r){return new f(r,q,i,j.length)}}}).call(c.prototype)});define("ace/mode/folding/csharp",["require","exports","module","ace/lib/oop","ace/range","ace/mode/folding/cstyle"],function(g,b,d){var e=g("../../lib/oop");var f=g("../../range").Range;var a=g("./cstyle").FoldMode;var c=b.FoldMode=function(h){if(h){this.foldingStartMarker=new RegExp(this.foldingStartMarker.source.replace(/\|[^|]*?$/,"|"+h.start));this.foldingStopMarker=new RegExp(this.foldingStopMarker.source.replace(/\|[^|]*?$/,"|"+h.end))}};e.inherits(c,a);(function(){this.usingRe=/^\s*using \S/;this.getFoldWidgetRangeBase=this.getFoldWidgetRange;this.getFoldWidgetBase=this.getFoldWidget;this.getFoldWidget=function(n,h,m){var i=this.getFoldWidgetBase(n,h,m);if(!i){var j=n.getLine(m);if(/^\s*#region\b/.test(j)){return"start"}var o=this.usingRe;if(o.test(j)){var l=n.getLine(m-1);var k=n.getLine(m+1);if(!o.test(l)&&o.test(k)){return"start"}}}return i};this.getFoldWidgetRange=function(l,h,k){var j=this.getFoldWidgetRangeBase(l,h,k);if(j){return j}var i=l.getLine(k);if(this.usingRe.test(i)){return this.getUsingStatementBlock(l,i,k)}if(/^\s*#region\b/.test(i)){return this.getRegionBlock(l,i,k)}};this.getUsingStatementBlock=function(m,j,l){var n=j.match(this.usingRe)[0].length-1;var k=m.getLength();var o=l;var i=l;while(++l<k){j=m.getLine(l);if(/^\s*$/.test(j)){continue}if(!this.usingRe.test(j)){break}i=l}if(i>o){var h=m.getLine(i).length;return new f(o,n,i,h)}};this.getRegionBlock=function(p,j,o){var q=j.search(/\s*$/);var l=p.getLength();var r=o;var n=/^\s*#(end)?region\b/;var h=1;while(++o<l){j=p.getLine(o);var k=n.exec(j);if(!k){continue}if(k[1]){h--}else{h++}if(!h){break}}var i=o;if(i>r){return new f(r,q,i,j.length)}}}).call(c.prototype)});define("ace/mode/csharp",["require","exports","module","ace/lib/oop","ace/mode/text","ace/mode/csharp_highlight_rules","ace/mode/matching_brace_outdent","ace/mode/behaviour/cstyle","ace/mode/folding/csharp"],function(i,d,g){var h=i("../lib/oop");var j=i("./text").Mode;var a=i("./csharp_highlight_rules").CSharpHighlightRules;var e=i("./matching_brace_outdent").MatchingBraceOutdent;var b=i("./behaviour/cstyle").CstyleBehaviour;var c=i("./folding/csharp").FoldMode;var f=function(){this.HighlightRules=a;this.$outdent=new e();this.$behaviour=new b();this.foldingRules=new c()};h.inherits(f,j);(function(){this.lineCommentStart="//";this.blockComment={start:"/*",end:"*/"};this.getNextLineIndent=function(n,l,o){var k=this.$getIndent(l);var p=this.getTokenizer().getLineTokens(l,n);var q=p.tokens;if(q.length&&q[q.length-1].type=="comment"){return k}if(n=="start"){var m=l.match(/^.*[\{\(\[]\s*$/);if(m){k+=o}}return k};this.checkOutdent=function(m,l,k){return this.$outdent.checkOutdent(l,k)};this.autoOutdent=function(m,k,l){this.$outdent.autoOutdent(k,l)};this.createWorker=function(k){return null};this.$id="ace/mode/csharp"}).call(f.prototype);d.Mode=f});
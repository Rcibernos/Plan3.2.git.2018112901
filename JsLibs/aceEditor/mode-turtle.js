define("ace/mode/turtle_highlight_rules",["require","exports","module","ace/lib/oop","ace/mode/text_highlight_rules"],function(d,a,b){var c=d("../lib/oop");var e=d("./text_highlight_rules").TextHighlightRules;var f=function(){this.$rules={start:[{include:"#comments"},{include:"#strings"},{include:"#base-prefix-declarations"},{include:"#string-language-suffixes"},{include:"#string-datatype-suffixes"},{include:"#relative-urls"},{include:"#xml-schema-types"},{include:"#rdf-schema-types"},{include:"#owl-types"},{include:"#qnames"},{include:"#punctuation-operators"}],"#base-prefix-declarations":[{token:"keyword.other.prefix.turtle",regex:/@(?:base|prefix)/}],"#comments":[{token:["punctuation.definition.comment.turtle","comment.line.hash.turtle"],regex:/(#)(.*$)/}],"#owl-types":[{token:"support.type.datatype.owl.turtle",regex:/owl:[a-zA-Z]+/}],"#punctuation-operators":[{token:"keyword.operator.punctuation.turtle",regex:/;|,|\.|\(|\)|\[|\]/}],"#qnames":[{token:"entity.name.other.qname.turtle",regex:/(?:[a-zA-Z][-_a-zA-Z0-9]*)?:(?:[_a-zA-Z][-_a-zA-Z0-9]*)?/}],"#rdf-schema-types":[{token:"support.type.datatype.rdf.schema.turtle",regex:/rdfs?:[a-zA-Z]+|(?:^|\s)a(?:\s|$)/}],"#relative-urls":[{token:"string.quoted.other.relative.url.turtle",regex:/</,push:[{token:"string.quoted.other.relative.url.turtle",regex:/>/,next:"pop"},{defaultToken:"string.quoted.other.relative.url.turtle"}]}],"#string-datatype-suffixes":[{token:"keyword.operator.datatype.suffix.turtle",regex:/\^\^/}],"#string-language-suffixes":[{token:["keyword.operator.language.suffix.turtle","constant.language.suffix.turtle"],regex:/(?!")(@)([a-z]+(?:\-[a-z0-9]+)*)/}],"#strings":[{token:"string.quoted.triple.turtle",regex:/"""/,push:[{token:"string.quoted.triple.turtle",regex:/"""/,next:"pop"},{defaultToken:"string.quoted.triple.turtle"}]},{token:"string.quoted.double.turtle",regex:/"/,push:[{token:"string.quoted.double.turtle",regex:/"/,next:"pop"},{token:"invalid.string.newline",regex:/$/},{token:"constant.character.escape.turtle",regex:/\\./},{defaultToken:"string.quoted.double.turtle"}]}],"#xml-schema-types":[{token:"support.type.datatype.xml.schema.turtle",regex:/xsd?:[a-z][a-zA-Z]+/}]};this.normalizeRules()};f.metaData={fileTypes:["ttl","nt"],name:"Turtle",scopeName:"source.turtle"};c.inherits(f,e);a.TurtleHighlightRules=f});define("ace/mode/folding/cstyle",["require","exports","module","ace/lib/oop","ace/range","ace/mode/folding/fold_mode"],function(g,b,d){var e=g("../../lib/oop");var f=g("../../range").Range;var a=g("./fold_mode").FoldMode;var c=b.FoldMode=function(h){if(h){this.foldingStartMarker=new RegExp(this.foldingStartMarker.source.replace(/\|[^|]*?$/,"|"+h.start));this.foldingStopMarker=new RegExp(this.foldingStopMarker.source.replace(/\|[^|]*?$/,"|"+h.end))}};e.inherits(c,a);(function(){this.foldingStartMarker=/(\{|\[)[^\}\]]*$|^\s*(\/\*)/;this.foldingStopMarker=/^[^\[\{]*(\}|\])|^[\s\*]*(\*\/)/;this.singleLineBlockCommentRe=/^\s*(\/\*).*\*\/\s*$/;this.tripleStarBlockCommentRe=/^\s*(\/\*\*\*).*\*\/\s*$/;this.startRegionRe=/^\s*(\/\*|\/\/)#?region\b/;this._getFoldWidgetBase=this.getFoldWidget;this.getFoldWidget=function(l,h,k){var j=l.getLine(k);if(this.singleLineBlockCommentRe.test(j)){if(!this.startRegionRe.test(j)&&!this.tripleStarBlockCommentRe.test(j)){return""}}var i=this._getFoldWidgetBase(l,h,k);if(!i&&this.startRegionRe.test(j)){return"start"}return i};this.getFoldWidgetRange=function(p,h,o,j){var l=p.getLine(o);if(this.startRegionRe.test(l)){return this.getCommentRegionBlock(p,l,o)}var m=l.match(this.foldingStartMarker);if(m){var k=m.index;if(m[1]){return this.openingBracketBlock(p,m[1],o,k)}var n=p.getCommentFoldRange(o,k+m[0].length,1);if(n&&!n.isMultiLine()){if(j){n=this.getSectionRange(p,o)}else{if(h!="all"){n=null}}}return n}if(h==="markbegin"){return}var m=l.match(this.foldingStopMarker);if(m){var k=m.index+m[0].length;if(m[1]){return this.closingBracketBlock(p,m[1],o,k)}return p.getCommentFoldRange(o,k,-1)}};this.getSectionRange=function(m,l){var j=m.getLine(l);var o=j.search(/\S/);var p=l;var n=j.length;l=l+1;var h=l;var k=m.getLength();while(++l<k){j=m.getLine(l);var i=j.search(/\S/);if(i===-1){continue}if(o>i){break}var q=this.getFoldWidgetRange(m,"all",l);if(q){if(q.start.row<=p){break}else{if(q.isMultiLine()){l=q.end.row}else{if(o==i){break}}}}h=l}return new f(p,n,h,m.getLine(h).length)};this.getCommentRegionBlock=function(p,j,o){var q=j.search(/\s*$/);var l=p.getLength();var r=o;var n=/^\s*(?:\/\*|\/\/|--)#?(end)?region\b/;var h=1;while(++o<l){j=p.getLine(o);var k=n.exec(j);if(!k){continue}if(k[1]){h--}else{h++}if(!h){break}}var i=o;if(i>r){return new f(r,q,i,j.length)}}}).call(c.prototype)});define("ace/mode/turtle",["require","exports","module","ace/lib/oop","ace/mode/text","ace/mode/turtle_highlight_rules","ace/mode/folding/cstyle"],function(f,a,d){var e=f("../lib/oop");var g=f("./text").Mode;var h=f("./turtle_highlight_rules").TurtleHighlightRules;var b=f("./folding/cstyle").FoldMode;var c=function(){this.HighlightRules=h;this.foldingRules=new b()};e.inherits(c,g);(function(){this.$id="ace/mode/turtle"}).call(c.prototype);a.Mode=c});
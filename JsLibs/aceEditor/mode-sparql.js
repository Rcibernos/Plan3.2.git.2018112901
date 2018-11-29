define("ace/mode/sparql_highlight_rules",["require","exports","module","ace/lib/oop","ace/mode/text_highlight_rules"],function(d,a,b){var c=d("../lib/oop");var f=d("./text_highlight_rules").TextHighlightRules;var e=function(){this.$rules={start:[{include:"#comments"},{include:"#strings"},{include:"#string-language-suffixes"},{include:"#string-datatype-suffixes"},{include:"#logic-operators"},{include:"#relative-urls"},{include:"#xml-schema-types"},{include:"#rdf-schema-types"},{include:"#owl-types"},{include:"#qnames"},{include:"#keywords"},{include:"#built-in-functions"},{include:"#variables"},{include:"#boolean-literal"},{include:"#punctuation-operators"}],"#boolean-literal":[{token:"constant.language.boolean.sparql",regex:/true|false/}],"#built-in-functions":[{token:"support.function.sparql",regex:/[Aa][Bb][Ss]|[Aa][Vv][Gg]|[Bb][Nn][Oo][Dd][Ee]|[Bb][Oo][Uu][Nn][Dd]|[Cc][Ee][Ii][Ll]|[Cc][Oo][Aa][Ll][Ee][Ss][Cc][Ee]|[Cc][Oo][Nn][Cc][Aa][Tt]|[Cc][Oo][Nn][Tt][Aa][Ii][Nn][Ss]|[Cc][Oo][Uu][Nn][Tt]|[Dd][Aa][Tt][Aa][Tt][Yy][Pp][Ee]|[Dd][Aa][Yy]|[Ee][Nn][Cc][Oo][Dd][Ee]_[Ff][Oo][Rr]_[Uu][Rr][Ii]|[Ee][Xx][Ii][Ss][Tt][Ss]|[Ff][Ll][Oo][Oo][Rr]|[Gg][Rr][Oo][Uu][Pp]_[Cc][Oo][Nn][Cc][Aa][Tt]|[Hh][Oo][Uu][Rr][Ss]|[Ii][Ff]|[Ii][Rr][Ii]|[Ii][Ss][Bb][Ll][Aa][Nn][Kk]|[Ii][Ss][Ii][Rr][Ii]|[Ii][Ss][Ll][Ii][Tt][Ee][Rr][Aa][Ll]|[Ii][Ss][Nn][Uu][Mm][Ee][Rr][Ii][Cc]|[Ii][Ss][Uu][Rr][Ii]|[Ll][Aa][Nn][Gg]|[Ll][Aa][Nn][Gg][Mm][Aa][Tt][Cc][Hh][Ee][Ss]|[Ll][Cc][Aa][Ss][Ee]|[Mm][Aa][Xx]|[Mm][Dd]5|[Mm][Ii][Nn]|[Mm][Ii][Nn][Uu][Tt][Ee][Ss]|[Mm][Oo][Nn][Tt][Hh]|[Nn][Oo][Ww]|[Rr][Aa][Nn][Dd]|[Rr][Ee][Gg][Ee][Xx]|[Rr][Ee][Pp][Ll][Aa][Cc][Ee]|[Rr][Oo][Uu][Nn][Dd]|[Ss][Aa][Mm][Ee][Tt][Ee][Rr][Mm]|[Ss][Aa][Mm][Pp][Ll][Ee]|[Ss][Ee][Cc][Oo][Nn][Dd][Ss]|[Ss][Ee][Pp][Aa][Rr][Aa][Tt][Oo][Rr]|[Ss][Hh][Aa](?:1|256|384|512)|[Ss][Tt][Rr]|[Ss][Tt][Rr][Aa][Ff][Tt][Ee][Rr]|[Ss][Tt][Rr][Bb][Ee][Ff][Oo][Rr][Ee]|[Ss][Tt][Rr][Dd][Tt]|[Ss][Tt][Rr][Ee][Nn][Dd][Ss]|[Ss][Tt][Rr][Ll][Aa][Nn][Gg]|[Ss][Tt][Rr][Ll][Ee][Nn]|[Ss][Tt][Rr][Ss][Tt][Aa][Rr][Tt][Ss]|[Ss][Tt][Rr][Uu][Uu][Ii][Dd]|[Ss][Uu][Bb][Ss][Tt][Rr]|[Ss][Uu][Mm]|[Tt][Ii][Mm][Ee][Zz][Oo][Nn][Ee]|[Tt][Zz]|[Uu][Cc][Aa][Ss][Ee]|[Uu][Rr][Ii]|[Uu][Uu][Ii][Dd]|[Yy][Ee][Aa][Rr]/}],"#comments":[{token:["punctuation.definition.comment.sparql","comment.line.hash.sparql"],regex:/(#)(.*$)/}],"#keywords":[{token:"keyword.other.sparql",regex:/[Aa][Dd][Dd]|[Aa][Ll][Ll]|[Aa][Ss]|[As][Ss][Cc]|[Aa][Ss][Kk]|[Bb][Aa][Ss][Ee]|[Bb][Ii][Nn][Dd]|[Bb][Yy]|[Cc][Ll][Ee][Aa][Rr]|[Cc][Oo][Nn][Ss][Tt][Rr][Uu][Cc][Tt]|[Cc][Oo][Pp][Yy]|[Cc][Rr][Ee][Aa][Tt][Ee]|[Dd][Aa][Tt][Aa]|[Dd][Ee][Ff][Aa][Uu][Ll][Tt]|[Dd][Ee][Ll][Ee][Tt][Ee]|[Dd][Ee][Sc][Cc]|[Dd][Ee][Ss][Cc][Rr][Ii][Bb][Ee]|[Dd][Ii][Ss][Tt][Ii][Nn][Cc][Tt]|[Dd][Rr][Oo][Pp]|[Ff][Ii][Ll][Tt][Ee][Rr]|[Ff][Rr][Oo][Mm]|[Gg][Rr][Aa][Pp][Hh]|[Gg][Rr][Oo][Uu][Pp]|[Hh][Aa][Vv][Ii][Nn][Gg]|[Ii][Nn][Ss][Ee][Rr][Tt]|[Ll][Ii][Mm][Ii][Tt]|[Ll][Oo][Aa][Dd]|[Mm][Ii][Nn][Uu][Ss]|[Mm][Oo][Vv][Ee]|[Nn][Aa][Mm][Ee][Dd]|[Oo][Ff][Ff][Ss][Ee][Tt]|[Oo][Pp][Tt][Ii][Oo][Nn][Aa][Ll]|[Oo][Rr][Dd][Ee][Rr]|[Pp][Rr][Ee][Ff][Ii][Xx]|[Rr][Ee][Dd][Uu][Cc][Ee][Dd]|[Ss][Ee][Ll][Ee][Cc][Tt]|[Ss][Ee][Pp][Aa][Rr][Aa][Tt][Oo][Rr]|[Ss][Ee][Rr][Vv][Ii][Cc][Ee]|[Ss][Ii][Ll][Ee][Nn][Tt]|[Tt][Oo]|[Uu][Nn][Dd][Ee][Ff]|[Uu][Nn][Ii][Oo][Nn]|[Uu][Ss][Ii][Nn][Gg]|[Vv][Aa][Ll][Uu][Ee][Ss]|[Ww][He][Ee][Rr][Ee]|[Ww][Ii][Tt][Hh]/}],"#logic-operators":[{token:"keyword.operator.logical.sparql",regex:/\|\||&&|=|!=|<|>|<=|>=|(?:^|!?\s)IN(?:!?\s|$)|(?:^|!?\s)NOT(?:!?\s|$)|-|\+|\*|\/|\!/}],"#owl-types":[{token:"support.type.datatype.owl.sparql",regex:/owl:[a-zA-Z]+/}],"#punctuation-operators":[{token:"keyword.operator.punctuation.sparql",regex:/;|,|\.|\(|\)|\{|\}|\|/}],"#qnames":[{token:"entity.name.other.qname.sparql",regex:/(?:[a-zA-Z][-_a-zA-Z0-9]*)?:(?:[_a-zA-Z][-_a-zA-Z0-9]*)?/}],"#rdf-schema-types":[{token:"support.type.datatype.rdf.schema.sparql",regex:/rdfs?:[a-zA-Z]+|(?:^|\s)a(?:\s|$)/}],"#relative-urls":[{token:"string.quoted.other.relative.url.sparql",regex:/</,push:[{token:"string.quoted.other.relative.url.sparql",regex:/>/,next:"pop"},{defaultToken:"string.quoted.other.relative.url.sparql"}]}],"#string-datatype-suffixes":[{token:"keyword.operator.datatype.suffix.sparql",regex:/\^\^/}],"#string-language-suffixes":[{token:["keyword.operator.language.suffix.sparql","constant.language.suffix.sparql"],regex:/(?!")(@)([a-z]+(?:\-[a-z0-9]+)*)/}],"#strings":[{token:"string.quoted.triple.sparql",regex:/"""/,push:[{token:"string.quoted.triple.sparql",regex:/"""/,next:"pop"},{defaultToken:"string.quoted.triple.sparql"}]},{token:"string.quoted.double.sparql",regex:/"/,push:[{token:"string.quoted.double.sparql",regex:/"/,next:"pop"},{token:"invalid.string.newline",regex:/$/},{token:"constant.character.escape.sparql",regex:/\\./},{defaultToken:"string.quoted.double.sparql"}]}],"#variables":[{token:"variable.other.sparql",regex:/(?:\?|\$)[-_a-zA-Z0-9]+/}],"#xml-schema-types":[{token:"support.type.datatype.schema.sparql",regex:/xsd?:[a-z][a-zA-Z]+/}]};this.normalizeRules()};e.metaData={fileTypes:["rq","sparql"],name:"SPARQL",scopeName:"source.sparql"};c.inherits(e,f);a.SPARQLHighlightRules=e});define("ace/mode/folding/cstyle",["require","exports","module","ace/lib/oop","ace/range","ace/mode/folding/fold_mode"],function(g,b,d){var e=g("../../lib/oop");var f=g("../../range").Range;var a=g("./fold_mode").FoldMode;var c=b.FoldMode=function(h){if(h){this.foldingStartMarker=new RegExp(this.foldingStartMarker.source.replace(/\|[^|]*?$/,"|"+h.start));this.foldingStopMarker=new RegExp(this.foldingStopMarker.source.replace(/\|[^|]*?$/,"|"+h.end))}};e.inherits(c,a);(function(){this.foldingStartMarker=/(\{|\[)[^\}\]]*$|^\s*(\/\*)/;this.foldingStopMarker=/^[^\[\{]*(\}|\])|^[\s\*]*(\*\/)/;this.singleLineBlockCommentRe=/^\s*(\/\*).*\*\/\s*$/;this.tripleStarBlockCommentRe=/^\s*(\/\*\*\*).*\*\/\s*$/;this.startRegionRe=/^\s*(\/\*|\/\/)#?region\b/;this._getFoldWidgetBase=this.getFoldWidget;this.getFoldWidget=function(l,h,k){var j=l.getLine(k);if(this.singleLineBlockCommentRe.test(j)){if(!this.startRegionRe.test(j)&&!this.tripleStarBlockCommentRe.test(j)){return""}}var i=this._getFoldWidgetBase(l,h,k);if(!i&&this.startRegionRe.test(j)){return"start"}return i};this.getFoldWidgetRange=function(p,h,o,j){var l=p.getLine(o);if(this.startRegionRe.test(l)){return this.getCommentRegionBlock(p,l,o)}var m=l.match(this.foldingStartMarker);if(m){var k=m.index;if(m[1]){return this.openingBracketBlock(p,m[1],o,k)}var n=p.getCommentFoldRange(o,k+m[0].length,1);if(n&&!n.isMultiLine()){if(j){n=this.getSectionRange(p,o)}else{if(h!="all"){n=null}}}return n}if(h==="markbegin"){return}var m=l.match(this.foldingStopMarker);if(m){var k=m.index+m[0].length;if(m[1]){return this.closingBracketBlock(p,m[1],o,k)}return p.getCommentFoldRange(o,k,-1)}};this.getSectionRange=function(m,l){var j=m.getLine(l);var o=j.search(/\S/);var p=l;var n=j.length;l=l+1;var h=l;var k=m.getLength();while(++l<k){j=m.getLine(l);var i=j.search(/\S/);if(i===-1){continue}if(o>i){break}var q=this.getFoldWidgetRange(m,"all",l);if(q){if(q.start.row<=p){break}else{if(q.isMultiLine()){l=q.end.row}else{if(o==i){break}}}}h=l}return new f(p,n,h,m.getLine(h).length)};this.getCommentRegionBlock=function(p,j,o){var q=j.search(/\s*$/);var l=p.getLength();var r=o;var n=/^\s*(?:\/\*|\/\/|--)#?(end)?region\b/;var h=1;while(++o<l){j=p.getLine(o);var k=n.exec(j);if(!k){continue}if(k[1]){h--}else{h++}if(!h){break}}var i=o;if(i>r){return new f(r,q,i,j.length)}}}).call(c.prototype)});define("ace/mode/sparql",["require","exports","module","ace/lib/oop","ace/mode/text","ace/mode/sparql_highlight_rules","ace/mode/folding/cstyle"],function(f,a,d){var e=f("../lib/oop");var h=f("./text").Mode;var g=f("./sparql_highlight_rules").SPARQLHighlightRules;var b=f("./folding/cstyle").FoldMode;var c=function(){this.HighlightRules=g;this.foldingRules=new b()};e.inherits(c,h);(function(){this.$id="ace/mode/sparql"}).call(c.prototype);a.Mode=c});
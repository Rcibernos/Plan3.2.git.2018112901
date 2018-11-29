define("ace/mode/scheme_highlight_rules",["require","exports","module","ace/lib/oop","ace/mode/text_highlight_rules"],function(d,a,b){var c=d("../lib/oop");var f=d("./text_highlight_rules").TextHighlightRules;var e=function(){var h="case|do|let|loop|if|else|when";var j="eq?|eqv?|equal?|and|or|not|null?";var g="#t|#f";var k="cons|car|cdr|cond|lambda|lambda*|syntax-rules|format|set!|quote|eval|append|list|list?|member?|load";var i=this.createKeywordMapper({"keyword.control":h,"keyword.operator":j,"constant.language":g,"support.function":k},"identifier",true);this.$rules={start:[{token:"comment",regex:";.*$"},{token:["storage.type.function-type.scheme","text","entity.name.function.scheme"],regex:"(?:\\b(?:(define|define-syntax|define-macro))\\b)(\\s+)((?:\\w|\\-|\\!|\\?)*)"},{token:"punctuation.definition.constant.character.scheme",regex:"#:\\S+"},{token:["punctuation.definition.variable.scheme","variable.other.global.scheme","punctuation.definition.variable.scheme"],regex:"(\\*)(\\S*)(\\*)"},{token:"constant.numeric",regex:"#[xXoObB][0-9a-fA-F]+"},{token:"constant.numeric",regex:"[+-]?\\d+(?:(?:\\.\\d*)?(?:[eE][+-]?\\d+)?)?"},{token:i,regex:"[a-zA-Z_#][a-zA-Z0-9_\\-\\?\\!\\*]*"},{token:"string",regex:'"(?=.)',next:"qqstring"}],qqstring:[{token:"constant.character.escape.scheme",regex:"\\\\."},{token:"string",regex:'[^"\\\\]+',merge:true},{token:"string",regex:"\\\\$",next:"qqstring",merge:true},{token:"string",regex:'"|$',next:"start",merge:true}]}};c.inherits(e,f);a.SchemeHighlightRules=e});define("ace/mode/matching_parens_outdent",["require","exports","module","ace/range"],function(e,a,c){var d=e("../range").Range;var b=function(){};(function(){this.checkOutdent=function(g,f){if(!/^\s+$/.test(g)){return false}return/^\s*\)/.test(f)};this.autoOutdent=function(g,l){var i=g.getLine(l);var j=i.match(/^(\s*\))/);if(!j){return 0}var f=j[1].length;var k=g.findMatchingBracket({row:l,column:f});if(!k||k.row==l){return 0}var h=this.$getIndent(g.getLine(k.row));g.replace(new d(l,0,l,f-1),h)};this.$getIndent=function(f){var g=f.match(/^(\s+)/);if(g){return g[1]}return""}}).call(b.prototype);a.MatchingParensOutdent=b});define("ace/mode/scheme",["require","exports","module","ace/lib/oop","ace/mode/text","ace/mode/scheme_highlight_rules","ace/mode/matching_parens_outdent"],function(f,a,d){var e=f("../lib/oop");var h=f("./text").Mode;var g=f("./scheme_highlight_rules").SchemeHighlightRules;var b=f("./matching_parens_outdent").MatchingParensOutdent;var c=function(){this.HighlightRules=g;this.$outdent=new b();this.$behaviour=this.$defaultBehaviour};e.inherits(c,h);(function(){this.lineCommentStart=";";this.minorIndentFunctions=["define","lambda","define-macro","define-syntax","syntax-rules","define-record-type","define-structure"];this.$toIndent=function(i){return i.split("").map(function(j){if(/\s/.exec(j)){return j}else{return" "}}).join("")};this.$calculateIndent=function(q,r){var j=this.$getIndent(q);var l=0;var p,k;for(var n=q.length-1;n>=0;n--){k=q[n];if(k==="("){l--;p=true}else{if(k==="("||k==="["||k==="{"){l--;p=false}else{if(k===")"||k==="]"||k==="}"){l++}}}if(l<0){break}}if(l<0&&p){n+=1;var o=n;var m="";while(true){k=q[n];if(k===" "||k==="\t"){if(this.minorIndentFunctions.indexOf(m)!==-1){return this.$toIndent(q.substring(0,o-1)+r)}else{return this.$toIndent(q.substring(0,n+1))}}else{if(k===undefined){return this.$toIndent(q.substring(0,o-1)+r)}}m+=q[n];n++}}else{if(l<0&&!p){return this.$toIndent(q.substring(0,n+1))}else{if(l>0){j=j.substring(0,j.length-r.length);return j}else{return j}}}};this.getNextLineIndent=function(j,i,k){return this.$calculateIndent(i,k)};this.checkOutdent=function(k,j,i){return this.$outdent.checkOutdent(j,i)};this.autoOutdent=function(k,i,j){this.$outdent.autoOutdent(i,j)};this.$id="ace/mode/scheme"}).call(c.prototype);a.Mode=c});
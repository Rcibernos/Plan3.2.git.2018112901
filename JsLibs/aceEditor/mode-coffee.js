define("ace/mode/coffee_highlight_rules",["require","exports","module","ace/lib/oop","ace/mode/text_highlight_rules"],function(e,b,c){var d=e("../lib/oop");var f=e("./text_highlight_rules").TextHighlightRules;d.inherits(a,f);function a(){var h="[$A-Za-z_\\x7f-\\uffff][$\\w\\x7f-\\uffff]*";var k=("this|throw|then|try|typeof|super|switch|return|break|by|continue|catch|class|in|instanceof|is|isnt|if|else|extends|for|own|finally|function|while|when|new|no|not|delete|debugger|do|loop|of|off|or|on|unless|until|and|yes");var l=("true|false|null|undefined|NaN|Infinity");var i=("case|const|default|function|var|void|with|enum|export|implements|interface|let|package|private|protected|public|static|yield");var n=("Array|Boolean|Date|Function|Number|Object|RegExp|ReferenceError|String|Error|EvalError|InternalError|RangeError|ReferenceError|StopIteration|SyntaxError|TypeError|URIError|ArrayBuffer|Float32Array|Float64Array|Int16Array|Int32Array|Int8Array|Uint16Array|Uint32Array|Uint8Array|Uint8ClampedArray");var o=("Math|JSON|isNaN|isFinite|parseInt|parseFloat|encodeURI|encodeURIComponent|decodeURI|decodeURIComponent|String|");var p=("window|arguments|prototype|document");var j=this.createKeywordMapper({keyword:k,"constant.language":l,"invalid.illegal":i,"language.support.class":n,"language.support.function":o,"variable.language":p},"identifier");var g={token:["paren.lparen","variable.parameter","paren.rparen","text","storage.type"],regex:/(?:(\()((?:"[^")]*?"|'[^')]*?'|\/[^\/)]*?\/|[^()"'\/])*?)(\))(\s*))?([\-=]>)/.source};var m=/\\(?:x[0-9a-fA-F]{2}|u[0-9a-fA-F]{4}|[0-2][0-7]{0,2}|3[0-6][0-7]?|37[0-7]?|[4-7][0-7]?|.)/;this.$rules={start:[{token:"constant.numeric",regex:"(?:0x[\\da-fA-F]+|(?:\\d+(?:\\.\\d+)?|\\.\\d+)(?:[eE][+-]?\\d+)?)"},{stateName:"qdoc",token:"string",regex:"'''",next:[{token:"string",regex:"'''",next:"start"},{token:"constant.language.escape",regex:m},{defaultToken:"string"}]},{stateName:"qqdoc",token:"string",regex:'"""',next:[{token:"string",regex:'"""',next:"start"},{token:"paren.string",regex:"#{",push:"start"},{token:"constant.language.escape",regex:m},{defaultToken:"string"}]},{stateName:"qstring",token:"string",regex:"'",next:[{token:"string",regex:"'",next:"start"},{token:"constant.language.escape",regex:m},{defaultToken:"string"}]},{stateName:"qqstring",token:"string.start",regex:'"',next:[{token:"string.end",regex:'"',next:"start"},{token:"paren.string",regex:"#{",push:"start"},{token:"constant.language.escape",regex:m},{defaultToken:"string"}]},{stateName:"js",token:"string",regex:"`",next:[{token:"string",regex:"`",next:"start"},{token:"constant.language.escape",regex:m},{defaultToken:"string"}]},{regex:"[{}]",onMatch:function(s,r,q){this.next="";if(s=="{"&&q.length){q.unshift("start",r);return"paren"}if(s=="}"&&q.length){q.shift();this.next=q.shift()||"";if(this.next.indexOf("string")!=-1){return"paren.string"}}return"paren"}},{token:"string.regex",regex:"///",next:"heregex"},{token:"string.regex",regex:/(?:\/(?![\s=])[^[\/\n\\]*(?:(?:\\[\s\S]|\[[^\]\n\\]*(?:\\[\s\S][^\]\n\\]*)*])[^[\/\n\\]*)*\/)(?:[imgy]{0,4})(?!\w)/},{token:"comment",regex:"###(?!#)",next:"comment"},{token:"comment",regex:"#.*"},{token:["punctuation.operator","text","identifier"],regex:"(\\.)(\\s*)("+i+")"},{token:"punctuation.operator",regex:"\\.{1,3}"},{token:["keyword","text","language.support.class","text","keyword","text","language.support.class"],regex:"(class)(\\s+)("+h+")(?:(\\s+)(extends)(\\s+)("+h+"))?"},{token:["entity.name.function","text","keyword.operator","text"].concat(g.token),regex:"("+h+")(\\s*)([=:])(\\s*)"+g.regex},g,{token:"variable",regex:"@(?:"+h+")?"},{token:j,regex:h},{token:"punctuation.operator",regex:"\\,|\\."},{token:"storage.type",regex:"[\\-=]>"},{token:"keyword.operator",regex:"(?:[-+*/%<>&|^!?=]=|>>>=?|\\-\\-|\\+\\+|::|&&=|\\|\\|=|<<=|>>=|\\?\\.|\\.{2,3}|[!*+-=><])"},{token:"paren.lparen",regex:"[({[]"},{token:"paren.rparen",regex:"[\\]})]"},{token:"text",regex:"\\s+"}],heregex:[{token:"string.regex",regex:".*?///[imgy]{0,4}",next:"start"},{token:"comment.regex",regex:"\\s+(?:#.*)?"},{token:"string.regex",regex:"\\S+"}],comment:[{token:"comment",regex:"###",next:"start"},{defaultToken:"comment"}]};this.normalizeRules()}b.CoffeeHighlightRules=a});define("ace/mode/matching_brace_outdent",["require","exports","module","ace/range"],function(e,a,c){var d=e("../range").Range;var b=function(){};(function(){this.checkOutdent=function(g,f){if(!/^\s+$/.test(g)){return false}return/^\s*\}/.test(f)};this.autoOutdent=function(g,l){var i=g.getLine(l);var j=i.match(/^(\s*\})/);if(!j){return 0}var f=j[1].length;var k=g.findMatchingBracket({row:l,column:f});if(!k||k.row==l){return 0}var h=this.$getIndent(g.getLine(k.row));g.replace(new d(l,0,l,f-1),h)};this.$getIndent=function(f){return f.match(/^\s*/)[0]}}).call(b.prototype);a.MatchingBraceOutdent=b});define("ace/mode/folding/coffee",["require","exports","module","ace/lib/oop","ace/mode/folding/fold_mode","ace/range"],function(g,b,d){var e=g("../../lib/oop");var a=g("./fold_mode").FoldMode;var f=g("../../range").Range;var c=b.FoldMode=function(){};e.inherits(c,a);(function(){this.getFoldWidgetRange=function(q,j,p){var n=this.indentationBlock(q,p);if(n){return n}var o=/\S/;var l=q.getLine(p);var s=l.search(o);if(s==-1||l[s]!="#"){return}var r=l.length;var m=q.getLength();var t=p;var i=p;while(++p<m){l=q.getLine(p);var k=l.search(o);if(k==-1){continue}if(l[k]!="#"){break}i=p}if(i>t){var h=q.getLine(i).length;return new f(t,r,i,h)}};this.getFoldWidget=function(p,h,o){var j=p.getLine(o);var i=j.search(/\S/);var k=p.getLine(o+1);var m=p.getLine(o-1);var n=m.search(/\S/);var l=k.search(/\S/);if(i==-1){p.foldWidgets[o-1]=n!=-1&&n<l?"start":"";return""}if(n==-1){if(i==l&&j[i]=="#"&&k[i]=="#"){p.foldWidgets[o-1]="";p.foldWidgets[o+1]="";return"start"}}else{if(n==i&&j[i]=="#"&&m[i]=="#"){if(p.getLine(o-2).search(/\S/)==-1){p.foldWidgets[o-1]="start";p.foldWidgets[o+1]="";return""}}}if(n!=-1&&n<i){p.foldWidgets[o-1]="start"}else{p.foldWidgets[o-1]=""}if(i<l){return"start"}else{return""}}}).call(c.prototype)});define("ace/mode/coffee",["require","exports","module","ace/mode/coffee_highlight_rules","ace/mode/matching_brace_outdent","ace/mode/folding/coffee","ace/range","ace/mode/text","ace/worker/worker_client","ace/lib/oop"],function(h,a,d){var i=h("./coffee_highlight_rules").CoffeeHighlightRules;var f=h("./matching_brace_outdent").MatchingBraceOutdent;var b=h("./folding/coffee").FoldMode;var g=h("../range").Range;var j=h("./text").Mode;var k=h("../worker/worker_client").WorkerClient;var e=h("../lib/oop");function c(){this.HighlightRules=i;this.$outdent=new f();this.foldingRules=new b()}e.inherits(c,j);(function(){var l=/(?:[({[=:]|[-=]>|\b(?:else|try|(?:swi|ca)tch(?:\s+[$A-Za-z_\x7f-\uffff][$\w\x7f-\uffff]*)?|finally))\s*$|^\s*(else\b\s*)?(?:if|for|while|loop)\b(?!.*\bthen\b)/;this.lineCommentStart="#";this.blockComment={start:"###",end:"###"};this.getNextLineIndent=function(o,n,p){var m=this.$getIndent(n);var q=this.getTokenizer().getLineTokens(n,o).tokens;if(!(q.length&&q[q.length-1].type==="comment")&&o==="start"&&l.test(n)){m+=p}return m};this.checkOutdent=function(o,n,m){return this.$outdent.checkOutdent(n,m)};this.autoOutdent=function(o,m,n){this.$outdent.autoOutdent(m,n)};this.createWorker=function(m){var n=new k(["ace"],"ace/mode/coffee_worker","Worker");n.attachToDocument(m.getDocument());n.on("annotate",function(o){m.setAnnotations(o.data)});n.on("terminate",function(){m.clearAnnotations()});return n};this.$id="ace/mode/coffee"}).call(c.prototype);a.Mode=c});
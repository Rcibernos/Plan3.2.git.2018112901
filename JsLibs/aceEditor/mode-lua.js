define("ace/mode/lua_highlight_rules",["require","exports","module","ace/lib/oop","ace/mode/text_highlight_rules"],function(e,a,c){var d=e("../lib/oop");var f=e("./text_highlight_rules").TextHighlightRules;var b=function(){var q=("break|do|else|elseif|end|for|function|if|in|local|repeat|return|then|until|while|or|and|not");var g=("true|false|nil|_G|_VERSION");var l=("string|xpcall|package|tostring|print|os|unpack|require|getfenv|setmetatable|next|assert|tonumber|io|rawequal|collectgarbage|getmetatable|module|rawset|math|debug|pcall|table|newproxy|type|coroutine|_G|select|gcinfo|pairs|rawget|loadstring|ipairs|_VERSION|dofile|setfenv|load|error|loadfile|sub|upper|len|gfind|rep|find|match|char|dump|gmatch|reverse|byte|format|gsub|lower|preload|loadlib|loaded|loaders|cpath|config|path|seeall|exit|setlocale|date|getenv|difftime|remove|time|clock|tmpname|rename|execute|lines|write|close|flush|open|output|type|read|stderr|stdin|input|stdout|popen|tmpfile|log|max|acos|huge|ldexp|pi|cos|tanh|pow|deg|tan|cosh|sinh|random|randomseed|frexp|ceil|floor|rad|abs|sqrt|modf|asin|min|mod|fmod|log10|atan2|exp|sin|atan|getupvalue|debug|sethook|getmetatable|gethook|setmetatable|setlocal|traceback|setfenv|getinfo|setupvalue|getlocal|getregistry|getfenv|setn|insert|getn|foreachi|maxn|foreach|concat|sort|remove|resume|yield|status|wrap|create|running|__add|__sub|__mod|__unm|__concat|__lt|__index|__call|__gc|__metatable|__mul|__div|__pow|__len|__eq|__le|__newindex|__tostring|__mode|__tonumber");var s=("string|package|os|io|math|debug|table|coroutine");var i=("setn|foreach|foreachi|gcinfo|log10|maxn");var p=this.createKeywordMapper({keyword:q,"support.function":l,"keyword.deprecated":i,"constant.library":s,"constant.language":g,"variable.language":"self"},"identifier");var h="(?:(?:[1-9]\\d*)|(?:0))";var m="(?:0[xX][\\dA-Fa-f]+)";var n="(?:"+h+"|"+m+")";var k="(?:\\.\\d+)";var o="(?:\\d+)";var r="(?:(?:"+o+"?"+k+")|(?:"+o+"\\.))";var j="(?:"+r+")";this.$rules={start:[{stateName:"bracketedComment",onMatch:function(v,t,u){u.unshift(this.next,v.length-2,t);return"comment"},regex:/\-\-\[=*\[/,next:[{onMatch:function(v,t,u){if(v.length==u[1]){u.shift();u.shift();this.next=u.shift()}else{this.next=""}return"comment"},regex:/\]=*\]/,next:"start"},{defaultToken:"comment"}]},{token:"comment",regex:"\\-\\-.*$"},{stateName:"bracketedString",onMatch:function(v,t,u){u.unshift(this.next,v.length,t);return"string.start"},regex:/\[=*\[/,next:[{onMatch:function(v,t,u){if(v.length==u[1]){u.shift();u.shift();this.next=u.shift()}else{this.next=""}return"string.end"},regex:/\]=*\]/,next:"start"},{defaultToken:"string"}]},{token:"string",regex:'"(?:[^\\\\]|\\\\.)*?"'},{token:"string",regex:"'(?:[^\\\\]|\\\\.)*?'"},{token:"constant.numeric",regex:j},{token:"constant.numeric",regex:n+"\\b"},{token:p,regex:"[a-zA-Z_$][a-zA-Z0-9_$]*\\b"},{token:"keyword.operator",regex:"\\+|\\-|\\*|\\/|%|\\#|\\^|~|<|>|<=|=>|==|~=|=|\\:|\\.\\.\\.|\\.\\."},{token:"paren.lparen",regex:"[\\[\\(\\{]"},{token:"paren.rparen",regex:"[\\]\\)\\}]"},{token:"text",regex:"\\s+|\\w+"}]};this.normalizeRules()};d.inherits(b,f);a.LuaHighlightRules=b});define("ace/mode/folding/lua",["require","exports","module","ace/lib/oop","ace/mode/folding/fold_mode","ace/range","ace/token_iterator"],function(g,b,d){var e=g("../../lib/oop");var a=g("./fold_mode").FoldMode;var f=g("../../range").Range;var h=g("../../token_iterator").TokenIterator;var c=b.FoldMode=function(){};e.inherits(c,a);(function(){this.foldingStartMarker=/\b(function|then|do|repeat)\b|{\s*$|(\[=*\[)/;this.foldingStopMarker=/\bend\b|^\s*}|\]=*\]/;this.getFoldWidget=function(o,i,n){var l=o.getLine(n);var k=this.foldingStartMarker.test(l);var j=this.foldingStopMarker.test(l);if(k&&!j){var m=l.match(this.foldingStartMarker);if(m[1]=="then"&&/\belseif\b/.test(l)){return}if(m[1]){if(o.getTokenAt(n,m.index+1).type==="keyword"){return"start"}}else{if(m[2]){var p=o.bgTokenizer.getState(n)||"";if(p[0]=="bracketedComment"||p[0]=="bracketedString"){return"start"}}else{return"start"}}}if(i!="markbeginend"||!j||k&&j){return""}var m=l.match(this.foldingStopMarker);if(m[0]==="end"){if(o.getTokenAt(n,m.index+1).type==="keyword"){return"end"}}else{if(m[0][0]==="]"){var p=o.bgTokenizer.getState(n-1)||"";if(p[0]=="bracketedComment"||p[0]=="bracketedString"){return"end"}}else{return"end"}}};this.getFoldWidgetRange=function(m,i,l){var j=m.doc.getLine(l);var k=this.foldingStartMarker.exec(j);if(k){if(k[1]){return this.luaBlock(m,l,k.index+1)}if(k[2]){return m.getCommentFoldRange(l,k.index+1)}return this.openingBracketBlock(m,"{",l,k.index)}var k=this.foldingStopMarker.exec(j);if(k){if(k[0]==="end"){if(m.getTokenAt(l,k.index+1).type==="keyword"){return this.luaBlock(m,l,k.index+1)}}if(k[0][0]==="]"){return m.getCommentFoldRange(l,k.index+1)}return this.closingBracketBlock(m,"}",l,k.index+k[0].length)}};this.luaBlock=function(n,m,i){var r=new h(n,m,i);var k={"function":1,"do":1,then:1,elseif:-1,end:-1,repeat:1,until:-1};var s=r.getCurrentToken();if(!s||s.type!="keyword"){return}var t=s.value;var o=[t];var j=k[t];if(!j){return}var p=j===-1?r.getCurrentTokenColumn():n.getLine(m).length;var q=m;r.step=j===-1?r.stepBackward:r.stepForward;while(s=r.step()){if(s.type!=="keyword"){continue}var l=j*k[s.value];if(l>0){o.unshift(s.value)}else{if(l<=0){o.shift();if(!o.length&&s.value!="elseif"){break}if(l===0){o.unshift(s.value)}}}}var m=r.getCurrentTokenRow();if(j===-1){return new f(m,n.getLine(m).length,q,p)}else{return new f(q,p,m,r.getCurrentTokenColumn())}}}).call(c.prototype)});define("ace/mode/lua",["require","exports","module","ace/lib/oop","ace/mode/text","ace/mode/lua_highlight_rules","ace/mode/folding/lua","ace/range","ace/worker/worker_client"],function(h,a,e){var f=h("../lib/oop");var i=h("./text").Mode;var c=h("./lua_highlight_rules").LuaHighlightRules;var b=h("./folding/lua").FoldMode;var g=h("../range").Range;var j=h("../worker/worker_client").WorkerClient;var d=function(){this.HighlightRules=c;this.foldingRules=new b();this.$behaviour=this.$defaultBehaviour};f.inherits(d,i);(function(){this.lineCommentStart="--";this.blockComment={start:"--[",end:"]--"};var l={"function":1,then:1,"do":1,"else":1,elseif:1,repeat:1,end:-1,until:-1};var m=["else","elseif","end","until"];function k(q){var o=0;for(var n=0;n<q.length;n++){var p=q[n];if(p.type=="keyword"){if(p.value in l){o+=l[p.value]}}else{if(p.type=="paren.lparen"){o+=p.value.length}else{if(p.type=="paren.rparen"){o-=p.value.length}}}}if(o<0){return -1}else{if(o>0){return 1}else{return 0}}}this.getNextLineIndent=function(q,p,r){var n=this.$getIndent(p);var o=0;var s=this.getTokenizer().getLineTokens(p,q);var t=s.tokens;if(q=="start"){o=k(t)}if(o>0){return n+r}else{if(o<0&&n.substr(n.length-r.length)==r){if(!this.checkOutdent(q,p,"\n")){return n.substr(0,n.length-r.length)}}}return n};this.checkOutdent=function(p,o,n){if(n!="\n"&&n!="\r"&&n!="\r\n"){return false}if(o.match(/^\s*[\)\}\]]$/)){return true}var q=this.getTokenizer().getLineTokens(o.trim(),p).tokens;if(!q||!q.length){return false}return(q[0].type=="keyword"&&m.indexOf(q[0].value)!=-1)};this.autoOutdent=function(u,t,s){var q=t.getLine(s-1);var p=this.$getIndent(q).length;var r=this.getTokenizer().getLineTokens(q,"start").tokens;var v=t.getTabString().length;var o=p+v*k(r);var n=this.$getIndent(t.getLine(s)).length;if(n<=o){return}t.outdentRows(new g(s,0,s+2,0))};this.createWorker=function(n){var o=new j(["ace"],"ace/mode/lua_worker","Worker");o.attachToDocument(n.getDocument());o.on("annotate",function(p){n.setAnnotations(p.data)});o.on("terminate",function(){n.clearAnnotations()});return o};this.$id="ace/mode/lua"}).call(d.prototype);a.Mode=d});
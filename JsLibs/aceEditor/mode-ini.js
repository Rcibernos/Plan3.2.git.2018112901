define("ace/mode/ini_highlight_rules",["require","exports","module","ace/lib/oop","ace/mode/text_highlight_rules"],function(f,b,d){var e=f("../lib/oop");var g=f("./text_highlight_rules").TextHighlightRules;var a="\\\\(?:[\\\\0abtrn;#=:]|x[a-fA-F\\d]{4})";var c=function(){this.$rules={start:[{token:"punctuation.definition.comment.ini",regex:"#.*",push_:[{token:"comment.line.number-sign.ini",regex:"$|^",next:"pop"},{defaultToken:"comment.line.number-sign.ini"}]},{token:"punctuation.definition.comment.ini",regex:";.*",push_:[{token:"comment.line.semicolon.ini",regex:"$|^",next:"pop"},{defaultToken:"comment.line.semicolon.ini"}]},{token:["keyword.other.definition.ini","text","punctuation.separator.key-value.ini"],regex:"\\b([a-zA-Z0-9_.-]+)\\b(\\s*)(=)"},{token:["punctuation.definition.entity.ini","constant.section.group-title.ini","punctuation.definition.entity.ini"],regex:"^(\\[)(.*?)(\\])"},{token:"punctuation.definition.string.begin.ini",regex:"'",push:[{token:"punctuation.definition.string.end.ini",regex:"'",next:"pop"},{token:"constant.language.escape",regex:a},{defaultToken:"string.quoted.single.ini"}]},{token:"punctuation.definition.string.begin.ini",regex:'"',push:[{token:"constant.language.escape",regex:a},{token:"punctuation.definition.string.end.ini",regex:'"',next:"pop"},{defaultToken:"string.quoted.double.ini"}]}]};this.normalizeRules()};c.metaData={fileTypes:["ini","conf"],keyEquivalent:"^~I",name:"Ini",scopeName:"source.ini"};e.inherits(c,g);b.IniHighlightRules=c});define("ace/mode/folding/ini",["require","exports","module","ace/lib/oop","ace/range","ace/mode/folding/fold_mode"],function(g,b,d){var e=g("../../lib/oop");var f=g("../../range").Range;var a=g("./fold_mode").FoldMode;var c=b.FoldMode=function(){};e.inherits(c,a);(function(){this.foldingStartMarker=/^\s*\[([^\])]*)]\s*(?:$|[;#])/;this.getFoldWidgetRange=function(q,j,p){var o=this.foldingStartMarker;var k=q.getLine(p);var l=k.match(o);if(!l){return}var s=l[1]+".";var r=k.length;var n=q.getLength();var t=p;var i=p;while(++p<n){k=q.getLine(p);if(/^\s*$/.test(k)){continue}l=k.match(o);if(l&&l[1].lastIndexOf(s,0)!==0){break}i=p}if(i>t){var h=q.getLine(i).length;return new f(t,r,i,h)}}}).call(c.prototype)});define("ace/mode/ini",["require","exports","module","ace/lib/oop","ace/mode/text","ace/mode/ini_highlight_rules","ace/mode/folding/ini"],function(g,a,e){var f=g("../lib/oop");var h=g("./text").Mode;var c=g("./ini_highlight_rules").IniHighlightRules;var b=g("./folding/ini").FoldMode;var d=function(){this.HighlightRules=c;this.foldingRules=new b();this.$behaviour=this.$defaultBehaviour};f.inherits(d,h);(function(){this.lineCommentStart=";";this.blockComment=null;this.$id="ace/mode/ini"}).call(d.prototype);a.Mode=d});
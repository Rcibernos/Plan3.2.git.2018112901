define("ace/ext/whitespace",["require","exports","module","ace/lib/lang"],function(d,a,c){var b=d("../lib/lang");a.$detectIndentation=function(n,h){var t=[];var e=[];var u=0;var p=0;var o=Math.min(n.length,1000);for(var l=0;l<o;l++){var m=n[l];if(!/^\s*[^*+\-\s]/.test(m)){continue}if(m[0]=="\t"){u++;p=-Number.MAX_VALUE}else{var s=m.match(/^ */)[0].length;if(s&&m[s]!="\t"){var g=s-p;if(g>0&&!(p%g)&&!(s%g)){e[g]=(e[g]||0)+1}t[s]=(t[s]||0)+1}p=s}while(l<o&&m[m.length-1]=="\\"){m=n[l++]}}function k(x){var y=0;for(var w=x;w<t.length;w+=x){y+=t[w]||0}return y}var f=e.reduce(function(i,w){return i+w},0);var j={score:0,length:0};var r=0;for(var l=1;l<12;l++){var q=k(l);if(l==1){r=q;q=t[1]?0.9:0.8;if(!t.length){q=0}}else{q/=r}if(e[l]){q+=e[l]/f}if(q>j.score){j={score:q,length:l}}}if(j.score&&j.score>1.4){var v=j.length}if(u>r+1){if(v==1||r<u/4||j.score<1.8){v=undefined}return{ch:"\t",length:v}}if(r>u+1){return{ch:" ",length:v}}};a.detectIndentation=function(g){var f=g.getLines(0,1000);var e=a.$detectIndentation(f)||{};if(e.ch){g.setUseSoftTabs(e.ch==" ")}if(e.length){g.setTabSize(e.length)}return e};a.trimTrailingSpace=function(r,q){var h=r.getDocument();var o=h.getAllLines();var p=q&&q.trimEmpty?-1:0;var g=[],e=-1;if(q&&q.keepCursorPosition){if(r.selection.rangeCount){r.selection.rangeList.ranges.forEach(function(u,l,t){var s=t[l+1];if(s&&s.cursor.row==u.cursor.row){return}g.push(u.cursor)})}else{g.push(r.selection.getCursor())}e=0}var f=g[e]&&g[e].row;for(var j=0,m=o.length;j<m;j++){var n=o[j];var k=n.search(/\s+$/);if(j==f){if(k<g[e].column&&k>p){k=g[e].column}e++;f=g[e]?g[e].row:-1}if(k>p){h.removeInLine(j,k,n.length)}}};a.convertIndentation=function(s,f,k){var p=s.getTabString()[0];var q=s.getTabSize();if(!k){k=q}if(!f){f=p}var u=f=="\t"?f:b.stringRepeat(f,k);var g=s.doc;var n=g.getAllLines();var e={};var t={};for(var h=0,j=n.length;h<j;h++){var m=n[h];var o=m.match(/^\s*/)[0];if(o){var y=s.$getStringScreenWidth(o)[0];var v=Math.floor(y/q);var r=y%q;var x=e[v]||(e[v]=b.stringRepeat(u,v));x+=t[r]||(t[r]=b.stringRepeat(" ",r));if(x!=o){g.removeInLine(h,0,o.length);g.insertInLine({row:h,column:0},x)}}}s.setTabSize(k);s.setUseSoftTabs(f==" ")};a.$parseStringArg=function(g){var e={};if(/t/.test(g)){e.ch="\t"}else{if(/s/.test(g)){e.ch=" "}}var f=g.match(/\d+/);if(f){e.length=parseInt(f[0],10)}return e};a.$parseArg=function(e){if(!e){return{}}if(typeof e=="string"){return a.$parseStringArg(e)}if(typeof e.text=="string"){return a.$parseStringArg(e.text)}return e};a.commands=[{name:"detectIndentation",exec:function(e){a.detectIndentation(e.session)}},{name:"trimTrailingSpace",exec:function(e){a.trimTrailingSpace(e.session)}},{name:"convertIndentation",exec:function(f,e){var g=a.$parseArg(e);a.convertIndentation(f.session,g.ch,g.length)}},{name:"setIndentation",exec:function(f,e){var g=a.$parseArg(e);g.length&&f.session.setTabSize(g.length);g.ch&&f.session.setUseSoftTabs(g.ch==" ")}}]});(function(){window.require(["ace/ext/whitespace"],function(){})})();
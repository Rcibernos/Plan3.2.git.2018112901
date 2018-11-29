define("ace/ext/searchbox",["require","exports","module","ace/lib/dom","ace/lib/lang","ace/lib/event","ace/keyboard/hash_handler","ace/lib/keys"],function(j,c,i){var a=j("../lib/dom");var g=j("../lib/lang");var b=j("../lib/event");var l='.ace_search {background-color: #ddd;color: #666;border: 1px solid #cbcbcb;border-top: 0 none;overflow: hidden;margin: 0;padding: 4px 6px 0 4px;position: absolute;top: 0;z-index: 99;white-space: normal;}.ace_search.left {border-left: 0 none;border-radius: 0px 0px 5px 0px;left: 0;}.ace_search.right {border-radius: 0px 0px 0px 5px;border-right: 0 none;right: 0;}.ace_search_form, .ace_replace_form {margin: 0 20px 4px 0;overflow: hidden;line-height: 1.9;}.ace_replace_form {margin-right: 0;}.ace_search_form.ace_nomatch {outline: 1px solid red;}.ace_search_field {border-radius: 3px 0 0 3px;background-color: white;color: black;border: 1px solid #cbcbcb;border-right: 0 none;box-sizing: border-box!important;outline: 0;padding: 0;font-size: inherit;margin: 0;line-height: inherit;padding: 0 6px;min-width: 17em;vertical-align: top;}.ace_searchbtn {border: 1px solid #cbcbcb;line-height: inherit;display: inline-block;padding: 0 6px;background: #fff;border-right: 0 none;border-left: 1px solid #dcdcdc;cursor: pointer;margin: 0;position: relative;box-sizing: content-box!important;color: #666;}.ace_searchbtn:last-child {border-radius: 0 3px 3px 0;border-right: 1px solid #cbcbcb;}.ace_searchbtn:disabled {background: none;cursor: default;}.ace_searchbtn:hover {background-color: #eef1f6;}.ace_searchbtn.prev, .ace_searchbtn.next {padding: 0px 0.7em}.ace_searchbtn.prev:after, .ace_searchbtn.next:after {content: "";border: solid 2px #888;width: 0.5em;height: 0.5em;border-width:  2px 0 0 2px;display:inline-block;transform: rotate(-45deg);}.ace_searchbtn.next:after {border-width: 0 2px 2px 0 ;}.ace_searchbtn_close {background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA4AAAAcCAYAAABRVo5BAAAAZ0lEQVR42u2SUQrAMAhDvazn8OjZBilCkYVVxiis8H4CT0VrAJb4WHT3C5xU2a2IQZXJjiQIRMdkEoJ5Q2yMqpfDIo+XY4k6h+YXOyKqTIj5REaxloNAd0xiKmAtsTHqW8sR2W5f7gCu5nWFUpVjZwAAAABJRU5ErkJggg==) no-repeat 50% 0;border-radius: 50%;border: 0 none;color: #656565;cursor: pointer;font: 16px/16px Arial;padding: 0;height: 14px;width: 14px;top: 9px;right: 7px;position: absolute;}.ace_searchbtn_close:hover {background-color: #656565;background-position: 50% 100%;color: white;}.ace_button {margin-left: 2px;cursor: pointer;-webkit-user-select: none;-moz-user-select: none;-o-user-select: none;-ms-user-select: none;user-select: none;overflow: hidden;opacity: 0.7;border: 1px solid rgba(100,100,100,0.23);padding: 1px;box-sizing:    border-box!important;color: black;}.ace_button:hover {background-color: #eee;opacity:1;}.ace_button:active {background-color: #ddd;}.ace_button.checked {border-color: #3399ff;opacity:1;}.ace_search_options{margin-bottom: 3px;text-align: right;-webkit-user-select: none;-moz-user-select: none;-o-user-select: none;-ms-user-select: none;user-select: none;clear: both;}.ace_search_counter {float: left;font-family: arial;padding: 0 8px;}';var d=j("../keyboard/hash_handler").HashHandler;var f=j("../lib/keys");var h=999;a.importCssString(l,"ace_searchbox");var e='<div class="ace_search right">    <span action="hide" class="ace_searchbtn_close"></span>    <div class="ace_search_form">        <input class="ace_search_field" placeholder="Search for" spellcheck="false"></input>        <span action="findPrev" class="ace_searchbtn prev"></span>        <span action="findNext" class="ace_searchbtn next"></span>        <span action="findAll" class="ace_searchbtn" title="Alt-Enter">All</span>    </div>    <div class="ace_replace_form">        <input class="ace_search_field" placeholder="Replace with" spellcheck="false"></input>        <span action="replaceAndFindNext" class="ace_searchbtn">Replace</span>        <span action="replaceAll" class="ace_searchbtn">All</span>    </div>    <div class="ace_search_options">        <span action="toggleReplace" class="ace_button" title="Toggel Replace mode"            style="float:left;margin-top:-2px;padding:0 5px;">+</span>        <span class="ace_search_counter"></span>        <span action="toggleRegexpMode" class="ace_button" title="RegExp Search">.*</span>        <span action="toggleCaseSensitive" class="ace_button" title="CaseSensitive Search">Aa</span>        <span action="toggleWholeWords" class="ace_button" title="Whole Word Search">\\b</span>        <span action="searchInSelection" class="ace_button" title="Search In Selection">S</span>    </div></div>'.replace(/> +/g,">");var k=function(n,o,p){var m=a.createElement("div");m.innerHTML=e;this.element=m.firstChild;this.setSession=this.setSession.bind(this);this.$init();this.setEditor(n)};(function(){this.setEditor=function(m){m.searchBox=this;m.renderer.scroller.appendChild(this.element);this.editor=m};this.setSession=function(m){;this.searchRange=null;this.$syncOptions(true)};this.$initElements=function(m){this.searchBox=m.querySelector(".ace_search_form");this.replaceBox=m.querySelector(".ace_replace_form");this.searchOption=m.querySelector("[action=searchInSelection]");this.replaceOption=m.querySelector("[action=toggleReplace]");this.regExpOption=m.querySelector("[action=toggleRegexpMode]");this.caseSensitiveOption=m.querySelector("[action=toggleCaseSensitive]");this.wholeWordOption=m.querySelector("[action=toggleWholeWords]");this.searchInput=this.searchBox.querySelector(".ace_search_field");this.replaceInput=this.replaceBox.querySelector(".ace_search_field");this.searchCounter=m.querySelector(".ace_search_counter")};this.$init=function(){var n=this.element;this.$initElements(n);var m=this;b.addListener(n,"mousedown",function(o){setTimeout(function(){m.activeInput.focus()},0);b.stopPropagation(o)});b.addListener(n,"click",function(p){var q=p.target||p.srcElement;var o=q.getAttribute("action");if(o&&m[o]){m[o]()}else{if(m.$searchBarKb.commands[o]){m.$searchBarKb.commands[o].exec(m)}}b.stopPropagation(p)});b.addCommandKeyListener(n,function(p,q,r){var s=f.keyCodeToString(r);var o=m.$searchBarKb.findKeyCommand(q,s);if(o&&o.exec){o.exec(m);b.stopEvent(p)}});this.$onChange=g.delayedCall(function(){m.find(false,false)});b.addListener(this.searchInput,"input",function(){m.$onChange.schedule(20)});b.addListener(this.searchInput,"focus",function(){m.activeInput=m.searchInput;m.searchInput.value&&m.highlight()});b.addListener(this.replaceInput,"focus",function(){m.activeInput=m.replaceInput;m.searchInput.value&&m.highlight()})};this.$closeSearchBarKb=new d([{bindKey:"Esc",name:"closeSearchBar",exec:function(m){m.searchBox.hide()}}]);this.$searchBarKb=new d();this.$searchBarKb.bindKeys({"Ctrl-f|Command-f":function(n){var m=n.isReplace=!n.isReplace;n.replaceBox.style.display=m?"":"none";n.replaceOption.checked=false;n.$syncOptions();n.searchInput.focus()},"Ctrl-H|Command-Option-F":function(m){m.replaceOption.checked=true;m.$syncOptions();m.replaceInput.focus()},"Ctrl-G|Command-G":function(m){m.findNext()},"Ctrl-Shift-G|Command-Shift-G":function(m){m.findPrev()},esc:function(m){setTimeout(function(){m.hide()})},Return:function(m){if(m.activeInput==m.replaceInput){m.replace()}m.findNext()},"Shift-Return":function(m){if(m.activeInput==m.replaceInput){m.replace()}m.findPrev()},"Alt-Return":function(m){if(m.activeInput==m.replaceInput){m.replaceAll()}m.findAll()},Tab:function(m){(m.activeInput==m.replaceInput?m.searchInput:m.replaceInput).focus()}});this.$searchBarKb.addCommands([{name:"toggleRegexpMode",bindKey:{win:"Alt-R|Alt-/",mac:"Ctrl-Alt-R|Ctrl-Alt-/"},exec:function(m){m.regExpOption.checked=!m.regExpOption.checked;m.$syncOptions()}},{name:"toggleCaseSensitive",bindKey:{win:"Alt-C|Alt-I",mac:"Ctrl-Alt-R|Ctrl-Alt-I"},exec:function(m){m.caseSensitiveOption.checked=!m.caseSensitiveOption.checked;m.$syncOptions()}},{name:"toggleWholeWords",bindKey:{win:"Alt-B|Alt-W",mac:"Ctrl-Alt-B|Ctrl-Alt-W"},exec:function(m){m.wholeWordOption.checked=!m.wholeWordOption.checked;m.$syncOptions()}},{name:"toggleReplace",exec:function(m){m.replaceOption.checked=!m.replaceOption.checked;m.$syncOptions()}},{name:"searchInSelection",exec:function(m){m.searchOption.checked=!m.searchRange;m.setSearchRange(m.searchOption.checked&&m.editor.getSelectionRange());m.$syncOptions()}}]);this.setSearchRange=function(m){this.searchRange=m;if(m){this.searchRangeMarker=this.editor.session.addMarker(m,"ace_active-line")}else{if(this.searchRangeMarker){this.editor.session.removeMarker(this.searchRangeMarker);this.searchRangeMarker=null}}};this.$syncOptions=function(m){a.setCssClass(this.replaceOption,"checked",this.searchRange);a.setCssClass(this.searchOption,"checked",this.searchOption.checked);this.replaceOption.textContent=this.replaceOption.checked?"-":"+";a.setCssClass(this.regExpOption,"checked",this.regExpOption.checked);a.setCssClass(this.wholeWordOption,"checked",this.wholeWordOption.checked);a.setCssClass(this.caseSensitiveOption,"checked",this.caseSensitiveOption.checked);this.replaceBox.style.display=this.replaceOption.checked?"":"none";this.find(false,false,m)};this.highlight=function(m){this.editor.session.highlight(m||this.editor.$search.$options.re);this.editor.renderer.updateBackMarkers()};this.find=function(q,m,o){var p=this.editor.find(this.searchInput.value,{skipCurrent:q,backwards:m,wrap:true,regExp:this.regExpOption.checked,caseSensitive:this.caseSensitiveOption.checked,wholeWord:this.wholeWordOption.checked,preventScroll:o,range:this.searchRange});var n=!p&&this.searchInput.value;a.setCssClass(this.searchBox,"ace_nomatch",n);this.editor._emit("findSearchBox",{match:!n});this.highlight();this.updateCounter()};this.updateCounter=function(){var p=this.editor;var t=p.$search.$options.re;var n=0;var o=0;if(t){var u=this.searchRange?p.session.getTextRange(this.searchRange):p.getValue();var s=p.session.doc.positionToIndex(p.selection.anchor);if(this.searchRange){s-=p.session.doc.positionToIndex(this.searchRange.start)}var q=t.lastIndex=0;var r;while((r=t.exec(u))){n++;q=r.index;if(q<=s){o++}if(n>h){break}if(!r[0]){t.lastIndex=q+=1;if(q>=u.length){break}}}}this.searchCounter.textContent=o+" of "+(n>h?h+"+":n)};this.findNext=function(){this.find(true,false)};this.findPrev=function(){this.find(true,true)};this.findAll=function(){var n=this.editor.findAll(this.searchInput.value,{regExp:this.regExpOption.checked,caseSensitive:this.caseSensitiveOption.checked,wholeWord:this.wholeWordOption.checked});var m=!n&&this.searchInput.value;a.setCssClass(this.searchBox,"ace_nomatch",m);this.editor._emit("findSearchBox",{match:!m});this.highlight();this.hide()};this.replace=function(){if(!this.editor.getReadOnly()){this.editor.replace(this.replaceInput.value)}};this.replaceAndFindNext=function(){if(!this.editor.getReadOnly()){this.editor.replace(this.replaceInput.value);this.findNext()}};this.replaceAll=function(){if(!this.editor.getReadOnly()){this.editor.replaceAll(this.replaceInput.value)}};this.hide=function(){this.active=false;this.setSearchRange(null);this.editor.off("changeSession",this.setSession);this.element.style.display="none";this.editor.keyBinding.removeKeyboardHandler(this.$closeSearchBarKb);this.editor.focus()};this.show=function(n,m){this.active=true;this.editor.on("changeSession",this.setSession);this.element.style.display="";this.replaceOption.checked=m;if(n){this.searchInput.value=n}this.searchInput.focus();this.searchInput.select();this.editor.keyBinding.addKeyboardHandler(this.$closeSearchBarKb);this.$syncOptions(true)};this.isFocused=function(){var m=document.activeElement;return m==this.searchInput||m==this.replaceInput}}).call(k.prototype);c.SearchBox=k;c.Search=function(m,n){var o=m.searchBox||new k(m);o.show(m.session.getTextRange(),n)}});(function(){window.require(["ace/ext/searchbox"],function(){})})();
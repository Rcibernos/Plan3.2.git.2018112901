jQuery.fn.dateField=function(g){if(!g.inputField){console.error("You must supply an input field");return false}if(typeof(g.firstDayOfWeek)=="undefined"){g.firstDayOfWeek=Date.firstDayOfWeek}if(typeof(g.useWheel)=="undefined"){g.useWheel=true}if(typeof(g.dateFormat)=="undefined"){g.dateFormat=Date.defaultFormat}if(g.inputField.is("[readonly]")||g.inputField.is("[disabled]")){return}var a={currentDate:new Date()};a.options=g;var i=this.eq(0);var h=$("<div>").addClass("calBox");var e=$("<div>").addClass("calNavBar");var d=$("<div>").addClass("calDay");d.addClass("calFullMonth");h.append(e).append(d);if(g.isSearchField){var f=$("<div>").addClass("shortCuts").html("<span title='last quarter'>LQ</span> <span title='last month'>LM</span> <span title='this month'>M</span> <span title='last week'>LW</span> <span title='this week'>W</span> <span title='yesterday'>Y</span> <span title='today'>T</span><span title='tomorrow'>TO</span> <span title='next week'>NW</span> <span title='next month'>NM</span> <span title='this quarter'>Q</span> <span title='next quarter'>NQ</span>");f.click(function(k){var j=$(k.target);if(j.is("span")){if(!g.isSearchField){g.inputField.val(Date.parseString(j.text().trim(),g.dateFormat).format(g.dateFormat),true)}else{g.inputField.val(j.text().trim())}h.remove()}});h.append(f)}$("body").append(h);nearBestPosition(i,h);h.bringToFront();$("body").oneTime(100,"regclibodcal",function(){$("body").bind("click.dateField",function(){$(this).unbind("click.dateField");h.remove()})});a.drawCalendar=function(j){a.currentDate=j;var l=function(m){var q=new Date(m.getTime());e.empty();q.setMonth(q.getMonth()-1);var p=$("<span>").addClass("calElement noCallback prev").attr("millis",q.getTime());q.setMonth(q.getMonth()+1);var n=$("<span>").html(q.format("MMMM yyyy"));q.setMonth(q.getMonth()+1);var o=$("<span>").addClass("calElement noCallback next").attr("millis",q.getTime());e.append(p).append(n).append(o)};var k=function(n){d.empty();var q=new Date();var r=parseInt((h.width()-4-(4*7))/7)+"px";var m=new Date(n);m.setFirstDayOfThisWeek(g.firstDayOfWeek);for(var o=0;o<7;o++){var p=$("<span>").addClass("calDayHeader").attr("day",m.getDay());p.css("width",r);p.html(Date.dayAbbreviations[m.getDay()]);if(typeof(g.dayHeaderRenderer)=="function"){g.dayHeaderRenderer(p,m.getDay())}d.append(p);m.setDate(m.getDate()+1)}m=new Date(n);m.setDate(1);m.setFirstDayOfThisWeek(g.firstDayOfWeek);var o=0;while((m.getMonth()<=n.getMonth()&&m.getFullYear()<=n.getFullYear())||m.getFullYear()<n.getFullYear()||(o%7!=0)){var p=$("<span>").addClass("calElement day").attr("millis",m.getTime());p.html("<span class=dayNumber>"+m.getDate()+"</span>").css("width",r);if(m.getYear()==q.getYear()&&m.getMonth()==q.getMonth()&&m.getDate()==q.getDate()){p.addClass("today")}if(m.getYear()==n.getYear()&&m.getMonth()==n.getMonth()&&m.getDate()==n.getDate()){p.addClass("selected")}if(m.getMonth()!=n.getMonth()){p.addClass("calOutOfScope")}if(typeof(g.dayRenderer)=="function"){g.dayRenderer(p,m)}d.append(p);m.setDate(m.getDate()+1);o++}};l(j);k(j)};h.click(function(l){var k=$(l.target).closest(".calElement");if(k.size()>0){var j=new Date(parseInt(k.attr("millis")));if(k.hasClass("day")){h.remove();if(!k.is(".noCallback")){g.inputField.val(j.format(g.dateFormat)).attr("millis",j.getTime()).focus();if(typeof(g.callback)=="function"){g.callback(j)}}}else{a.drawCalendar(j)}}l.stopPropagation()});if($.event.special.mousewheel&&g.useWheel){d.mousewheel(function(l,k){var j=new Date(a.currentDate.getTime());j.setMonth(j.getMonth()+k);a.drawCalendar(j);return false})}var c=g.inputField.val();if(!c||!Date.isValid(c,g.dateFormat,true)){a.drawCalendar(new Date())}else{var b=Date.parseString(c,g.dateFormat,true);if(!g.isSearchField){g.inputField.val(b.format(g.dateFormat)).attr("millis",b.getTime())}a.drawCalendar(b)}return a};
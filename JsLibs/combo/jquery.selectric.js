/*
 *         ,/
 *       ,'/
 *     ,' /
 *   ,'  /_____,
 * .'____    ,'
 *      /  ,'
 *     / ,'
 *    /,'
 *   /'
 *
 * Selectric ? v1.5.1 - http://lcdsantos.github.io/jQuery-Selectric/
 *
 * Copyright (c) 2013 Leonardo Santos; Dual licensed: MIT/GPL
 *
 */
(function(a){var e="selectric",c=function(){},b=function(h){var g,f="40-46 50-53 54-57 62-70 71-74 61 47 77".replace(/\d+/g,"\\3$&").split(" ");for(g in f){h=h.toLowerCase().replace(RegExp("["+f[g]+"]","g"),"aeiouncy".charAt(g))}return h},d=function(y,C){var C=a.extend({onOpen:c,onClose:c,maxHeight:300,keySearchTimeout:500,arrowButtonMarkup:'<b class="button">&#9662;</b>',disableOnMobile:true,border:1},C);if(C.disableOnMobile&&/android|ip(hone|od|ad)/i.test(navigator.userAgent)){return}var j=a(y),n=a('<div class="'+e+'"><p class="label"/>'+C.arrowButtonMarkup+"</div>"),g=a('<div class="'+e+'Items"><ul/></div>'),k=j.data(e,C).wrap("<div>").parent().append(n).append(g),G=[],z=false,h=a(".label",n),l=a("ul",g),i,u=".sl",f=a(document),m=a(window),B="keydown"+u,x="click"+u,E="",D,w=e+"Open",v=e+"Disabled",I=e+"TempShow",H="selected",F,A;function s(){var J=a("option",j.wrap('<div class="'+e+'HideSelect">')),K="",N=g.closest(":visible").children().not(":visible"),L=C.maxHeight,M;F=J.filter(":"+H).index();if(M=J.length){J.each(function(P,O){var Q=a(O).text();G[P]={value:a(O).val(),text:Q,slug:b(Q)};K+='<li class="'+(P==F?H:"")+(P==M-1?" last":"")+'">'+Q+"</li>"});l.empty().append(K);h.text(G[F].text)}n.add(j).off(u);k.prop("class",e+"Wrapper "+j.prop("class")+" "+v);if(!j.prop("disabled")){k.removeClass(v).hover(function(){a(this).toggleClass(e+"Hover")});n.on(x,function(O){z?o(O):r(O)});j.on(B,function(O){O.preventDefault();var P=O.which;if(/^(9|13|27)$/.test(P)){O.stopPropagation();t(F,true)}clearTimeout(D);if(P<37||P>40){var Q=RegExp("^"+(E+=String.fromCharCode(P)),"i");a.each(G,function(S,R){if(Q.test([R.slug,R.text])){t(S)}});D=setTimeout(function(){E=""},C.keySearchTimeout)}else{E="";t(/^(39|40)$/.test(P)?(F+1)%M:(F>0?F:M)-1)}}).on("focusin"+u,function(O){z||r(O)});i=a("li",g.removeAttr("style")).click(function(){t(a(this).index(),true);return false})}N.addClass(I);g.width(n.outerWidth()-(C.border*2)).height()>L&&g.height(L);N.removeClass(I)}s();function r(J){J.preventDefault();J.stopPropagation();a("."+w+" select")[e]("close");z=true;A=g.show().height();q();var K=m.scrollTop();J.type=="click"&&j.focus();m.scrollTop(K);f.on(x,o);k.addClass(w);p(F);C.onOpen.call(this)}function q(){if(z){g.css("top",(k.offset().top+k.outerHeight()+A>m.scrollTop()+m.height())?-A:"");setTimeout(q,100)}}function o(){var J=G[F].text;g.hide();J!=h.text()&&j.change();h.text(J);k.removeClass(w);z=false;f.off(u);C.onClose.call(j.blur())}function t(K,J){j.prop("value",G[F=K].value).find("option").eq(K).prop(H,true);i.removeClass(H).eq(K).addClass(H);p(K);J&&o()}function p(J){var M=i.eq(J).outerHeight(),N=i[J].offsetTop,L=g.scrollTop(),K=g.height(),O=N+M*2;g.scrollTop((O>L+K)?O-K:(N-M<L)?N-M:L)}j.on({refresh:s,destroy:function(){g.remove();n.remove();j.removeData(e).off(u+" refresh destroy open close").unwrap().unwrap()},open:r,close:o})};a.fn[e]=function(f,g){return this.each(function(){if(!a(this).data(e)){d(this,f||g)}else{if(""+f===f){a(this).trigger(f)}}})}}(jQuery));
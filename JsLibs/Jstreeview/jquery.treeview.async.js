(function(a){function b(h,g,d,e){function f(k){var j=a("<li/>").attr("id",this.id||"").html("<span>"+this.text+"</span>").appendTo(k);if(this.classes){j.children("span").addClass(this.classes)}if(this.expanded){j.addClass("open")}if(this.hasChildren||this.children&&this.children.length){var i=a("<ul/>").appendTo(j);if(this.hasChildren){j.addClass("hasChildren");f.call({classes:"placeholder",text:"&nbsp;",children:[]},i)}if(this.children&&this.children.length){a.each(this.children,f,[i])}}}a.ajax(a.extend(true,{url:h.url,dataType:"json",data:{root:g},success:function(i){d.empty();a.each(i,f,[d]);a(e).treeview({add:d})}},h.ajax))}var c=a.fn.treeview;a.fn.treeview=function(e){if(!e.url){return c.apply(this,arguments)}var d=this;if(!d.children().size()){b(e,"source",this,d)}var f=e.toggle;return c.call(this,a.extend({},e,{collapsed:true,toggle:function(){var g=a(this);if(g.hasClass("hasChildren")){var h=g.removeClass("hasChildren").find("ul");b(e,this.id,h,d)}if(f){f.apply(this,arguments)}}}))}})(jQuery);
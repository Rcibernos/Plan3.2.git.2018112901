(function(a){a.widget("sylightsUI.switchButton",{options:{checked:undefined,show_labels:true,labels_placement:"both",on_label:"ON",off_label:"OFF",width:25,height:11,button_width:12,clear:true,clear_after:null,on_callback:undefined,off_callback:undefined},_create:function(){if(this.options.checked===undefined){this.options.checked=this.element.prop("checked")}this._initLayout();this._initEvents()},_initLayout:function(){this.element.hide();this.off_label=a("<span>").addClass("switch-button-label");this.on_label=a("<span>").addClass("switch-button-label");this.button_bg=a("<div>").addClass("switch-button-background");this.button=a("<div>").addClass("switch-button-button");this.off_label.insertAfter(this.element);this.button_bg.insertAfter(this.off_label);this.on_label.insertAfter(this.button_bg);this.button_bg.append(this.button);if(this.options.clear){if(this.options.clear_after===null){this.options.clear_after=this.on_label}a("<div>").css({clear:"left"}).insertAfter(this.options.clear_after)}this._refresh();this.options.checked=!this.options.checked;this._toggleSwitch(true)},_refresh:function(){if(this.options.show_labels){this.off_label.show();this.on_label.show()}else{this.off_label.hide();this.on_label.hide()}switch(this.options.labels_placement){case"both":if(this.button_bg.prev()!==this.off_label||this.button_bg.next()!==this.on_label){this.off_label.detach();this.on_label.detach();this.off_label.insertBefore(this.button_bg);this.on_label.insertAfter(this.button_bg);this.on_label.addClass(this.options.checked?"on":"off").removeClass(this.options.checked?"off":"on");this.off_label.addClass(this.options.checked?"off":"on").removeClass(this.options.checked?"on":"off")}break;case"left":if(this.button_bg.prev()!==this.on_label||this.on_label.prev()!==this.off_label){this.off_label.detach();this.on_label.detach();this.off_label.insertBefore(this.button_bg);this.on_label.insertBefore(this.button_bg);this.on_label.addClass("on").removeClass("off");this.off_label.addClass("off").removeClass("on")}break;case"right":if(this.button_bg.next()!==this.off_label||this.off_label.next()!==this.on_label){this.off_label.detach();this.on_label.detach();this.off_label.insertAfter(this.button_bg);this.on_label.insertAfter(this.off_label);this.on_label.addClass("on").removeClass("off");this.off_label.addClass("off").removeClass("on")}break}this.on_label.html(this.options.on_label);this.off_label.html(this.options.off_label);this.button_bg.width(this.options.width);this.button_bg.height(this.options.height);this.button.width(this.options.button_width);this.button.height(this.options.height)},_initEvents:function(){var b=this;this.button_bg.click(function(c){c.preventDefault();c.stopPropagation();b._toggleSwitch(false);return false});this.button.click(function(c){c.preventDefault();c.stopPropagation();b._toggleSwitch(false);return false});this.on_label.click(function(c){if(b.options.checked&&b.options.labels_placement==="both"){return false}b._toggleSwitch(false);return false});this.off_label.click(function(c){if(!b.options.checked&&b.options.labels_placement==="both"){return false}b._toggleSwitch(false);return false})},_setOption:function(b,c){if(b==="checked"){this._setChecked(c);return}this.options[b]=c;this._refresh()},_setChecked:function(b){if(b===this.options.checked){return}this.options.checked=!b;this._toggleSwitch(false)},_toggleSwitch:function(c){if(!c&&(this.element.attr("readonly")=="readonly"||this.element.prop("disabled"))){return}this.options.checked=!this.options.checked;var d="";if(this.options.checked){this.element.prop("checked",true);this.element.change();var b=this.options.width-this.options.button_width;d="+="+b;if(this.options.labels_placement=="both"){this.off_label.removeClass("on").addClass("off");this.on_label.removeClass("off").addClass("on")}else{this.off_label.hide();this.on_label.show()}this.button_bg.addClass("checked");if(typeof this.options.on_callback==="function"){this.options.on_callback.call(this)}}else{this.element.prop("checked",false);this.element.change();d="-1px";if(this.options.labels_placement=="both"){this.off_label.removeClass("off").addClass("on");this.on_label.removeClass("on").addClass("off")}else{this.off_label.show();this.on_label.hide()}this.button_bg.removeClass("checked");if(typeof this.options.off_callback==="function"){this.options.off_callback.call(this)}}this.button.animate({left:d},250,"easeInOutCubic")}})})(jQuery);
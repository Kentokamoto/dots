// LICENSE_CODE ZON
'use strict'; /*jslint browser:true*/
define(['jquery', 'underscore', '/bext/pub/backbone.js',
    '/bext/pub/browser.js', 'text!views/ui_accel', '/util/zdot.js',
    '/bext/pub/popup_lib.js', '/bext/vpn/pub/ajax.js', '/util/storage.js'],
    function($, _, be_backbone, B, ui_accel, zdot, be_popup_lib, ajax,
    storage){
B.assert_popup('ui_accel');
var E = new (be_backbone.model.extend({
    _defaults: function(){ this.$el = $('<div>', {class: 'ui_accel'}); },
}))();

E.init = function(){
    if (E.inited)
        return;
    E.render();
};

var ui_accel_view_class = be_backbone.view.extend({
    className: 'popup-accel',
    events: {'click .switch': '_on_switch'},
    template: zdot.template(ui_accel),
    render: function(){
        this.$el.html(this.template());
        var is_on = storage.get_int('ext_accel_enabled');
        is_on = typeof is_on == 'undefined' ? true : !!is_on;
        this.$el.toggleClass('enabled', is_on);
        return be_backbone.view.prototype.render.apply(this);
    },
    _on_switch: function(){
        this.$el.toggleClass('enabled');
        var is_on = this.$el.hasClass('enabled');
        storage.set('ext_accel_enabled', is_on ? 1 : 0);
        be_popup_lib.perr_err({id: 'be_ui_accel_switch', info: {is_on:
            is_on}});
        ajax({url: window.conf.url_ccgi+'/accelerator',
            qs: {state: is_on ? 'enabled' : 'disabled'}});
    }
});

E.render = _.debounce(function(){
    this.ui_accel_view = new ui_accel_view_class();
    E.$el.empty().append(this.ui_accel_view.render().$el);
    this.ui_accel_view.$el.find('.arrow').addClass('animate');
    E.trigger('render_done');
});

return E; });

//LICENSE_CODE_ZON
'use strict'; /*jslint browser:true*/
define(function(){
var E = {conf: {"bootstrap":{"file":"//cdn4.hola.org/bootstrap.min.js?md5=31819-abda8436","link":"https://ajax.cdnjs.com/ajax/libs/twitter-bootstrap/3.2.0/","remote":"js/bootstrap.min.js","shim":{"deps":["jquery"]}},"jquery_url_parser":{"file":"//cdn4.hola.org/purl.min.js?md5=8771-53badcd0","link":"https://ajax.cdnjs.com/ajax/libs/jquery-url-parser/2.3.1/","remote":"purl.min.js","shim":{"deps":["jquery"]}},"jquery":{"file":"//cdn4.hola.org/jquery/1.11.1/jquery.min.js?md5=95821-d4a20d75","link":"https://ajax.cdnjs.com/ajax/libs/jquery/1.11.1/","remote":"jquery.min.js"},"jquery_2_1_4":{"file":"//cdn4.hola.org/jquery/2.1.4/jquery.min.js?md5=84380-4a356126","link":"https://ajax.cdnjs.com/ajax/libs/jquery/2.1.4/","remote":"jquery.min.js"},"jquery_1_11_1":{"file":"//cdn4.hola.org/jquery/1.11.1/jquery.min.js?md5=95821-d4a20d75","link":"https://ajax.cdnjs.com/ajax/libs/jquery/1.11.1/","remote":"jquery.min.js"},"jquery_cookie":{"file":"//cdn4.hola.org/jquery.cookie.min.js?md5=3121-d5528dde","link":"https://ajax.cdnjs.com/ajax/libs/jquery-cookie/1.4.1/","remote":"jquery.cookie.min.js","shim":{"deps":["jquery"]}},"underscore":{"file":"//cdn4.hola.org/underscore-min.js?md5=14682-dd9663be","link":"https://ajax.cdnjs.com/ajax/libs/underscore.js/1.6.0/","remote":"underscore-min.js"},"backbone":{"file":"//cdn4.hola.org/backbone/1.2.1/backbone-min.js?md5=22857-1671918b","link":"https://ajax.cdnjs.com/ajax/libs/backbone.js/1.2.1/","remote":"backbone-min.js","shim":{"deps":["jquery","underscore"]}},"backbone_1_2_1":{"file":"//cdn4.hola.org/backbone/1.2.1/backbone-min.js?md5=22857-1671918b","link":"https://ajax.cdnjs.com/ajax/libs/backbone.js/1.2.1/","remote":"backbone-min.js","shim":{"deps":["jquery","underscore"]}},"backbone_1_0_0":{"file":"//cdn4.hola.org/backbone/1.0.0/backbone-min.js?md5=25888-f18da2d3","shim":{"exports":"Backbone","deps":["jquery","underscore"]},"link":"https://ajax.cdnjs.com/ajax/libs/backbone.js/1.0.0/","remote":"backbone-min.js"},"backbone_1_1_2":{"file":"//cdn4.hola.org/backbone/1.1.2/backbone-min.js?md5=19999-9c3e3189","shim":{"exports":"Backbone","deps":["jquery","underscore"]},"link":"https://ajax.cdnjs.com/ajax/libs/backbone.js/1.1.2/","remote":"backbone-min.js"},"typeahead":{"file":"//cdn4.hola.org/typeahead.bundle.min.js?md5=28645-5a65070f","link":"https://ajax.cdnjs.com/ajax/libs/typeahead.js/0.10.2/","remote":"typeahead.bundle.min.js","shim":{"deps":["jquery"]}},"spin":{"file":"//cdn4.hola.org/spin.min.js?md5=4277-54540522","link":"https://ajax.cdnjs.com/ajax/libs/spin.js/2.3.2/","remote":"spin.min.js"},"text":{"file":"//cdn4.hola.org/requirejs.text.js?md5=15641-8fe8761d"}}};
E.alt_cdn = false;
var cdn_list = [];
E.cdn_link = 'holaalt-holanetworksltd.netdna-ssl.com';
E.c = function(name){
    var data = E.conf[name];
    if (typeof data.file!='string')
        throw '"local" should exist for alt_cdn cases';
    var cdn = E.alt_cdn ?
        data.file.replace(/\bcdn4\.hola\.org\b/, E.cdn_link) :
        data.link+data.remote;
    if (cdn)
        return [cdn, data.file];
    return cdn_list.length ?
        data.file.replace(/^\/\/cdn4\.hola\.org\b/, cdn_list[0]) : data.file;
};
E.b = function(name){
    var data = E.conf[name];
    if (typeof data.file!='string')
        throw '"local" should exists for alt_cdn cases';
    if (!E.alt_cdn&&data.link)
    {
        // XXX antonp: workaround caused manifest.json domain restrictions
        // in old extensions
        var link = data.link.replace('ajax.cdnjs.com', 'cdnjs.cloudflare.com');
        return link+data.remote;
    }
    return 'https:'+data.file.replace(/\bcdn4\.hola\.org\b/, E.cdn_link);
};
E.inject = function(config){
    var conf = E.conf;
    var cmap = config.map = config.map||{};
    Object.keys(conf).forEach(function(key){
        var cfg = conf[key];
        if (cfg.map && !cmap[key])
           cmap[key] = cfg.map;
        if (!config.paths[key])
            config.paths[key] = E.c(key);
        if (!config.shim[key] && cfg.shim)
            config.shim[key] = cfg.shim;
    });
};
return E; });

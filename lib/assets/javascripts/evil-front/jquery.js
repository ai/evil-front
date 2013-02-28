//= require evil-front/core

(function ($) {

    // Create namespace for jQuery
    evil.jquery = function(global, namespace) {
        // Namespace inside jQuery.
        global.$ = function (nodes) {
            this.nodes = nodes;
        };

        // Syntax sugar to add own method to `$.fn.evil`.
        global.$.extend = function (name, value) {
            if ( $.isPlainObject(name) ) {
                for ( key in name ) {
                    global.$.extend(key, name[key]);
                }
                return;
            }

            if ( $.isFunction(value) ) {
                var callback = value;
                value = function () {
                    return callback.apply(this.nodes, arguments);
                };
            }
            this.prototype[name] = value;
        };

        // Hack to add `$.fn.evil` namespace.
        var originaljQuery = $.fn.init;
        $.fn.init = function () {
            nodes = originaljQuery.apply(this, arguments);
            nodes[namespace] = new global.$(nodes);
            return nodes;
        };
        $.fn.init.prototype = originaljQuery.prototype;
    };

    // Create `evil.$` namespace.
    evil.jquery(evil, 'evil');

})(jQuery);

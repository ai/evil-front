//= require evil-front/core

(function() {
    var cache  = undefined;
    var inited = false;

    evil.transform3d = {

        // Check support for 3D transforms.
        check: function () {
            if ( typeof(cache) != 'undefined' ) {
                return cache;
            }

            var cache = typeof(evil.body.css('perspective')) != 'undefined';
            var style = document.body;
            if ( cache && typeof(style.webkitPerspective) != 'undefined' ) {
                cache = matchMedia("(transform-3d), (-webkit-transform-3d)");
                cache = cache.matches;
            }
            return cache;
        },

        // Add `transform3d` or `transform2s` class to body.
        init: function () {
            if ( inited ) {
                return;
            }
            inited = true;

            evil.doc.ready(function () {
                var type  = evil.transform3d.check() ? '3d' : '2d'
                evil.body.addClass('transform-' + type);
            });
        }
    }

})();

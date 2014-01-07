//= require evil-front/jquery

(function() {
    evil.$.extend('outside', function (callback) {
        var parent = this;

        var event = function(e) {
            var el = $(e.target);
            if ( !el.closest(parent).length ) {
                callback();
                off();
            }
        };

        if ( document.body.addEventListener ) {
            var set = function () {
                document.body.addEventListener('click', event, true);
                document.body.addEventListener('focus', event, true);
            }
            var off = function () {
                document.body.removeEventListener('click', event, true);
                document.body.removeEventListener('focus', event, true);
            };

        } else {
            var name = '.evil-outside-' + (new Date()).valueOf();

            var set = function () {
                evil.body.on('click' + name + ' focus' + name, event);
            }
            var off = function () {
                evil.body.off(name);
            };
        }

        setTimeout(set, 10);
        return off;
    });

})();

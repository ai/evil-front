//= require evil-front/jquery

(function() {
    var lastId = 0;

    evil.$.extend('outside', function (callback) {
        var parent = this;
        var name   = '.evil-outside-' + lastId;
        lastId    += 1;

        var set = function () {
            $('html').on('click' + name + ' focus' + name, function(e) {
                var el = $(e.target);
                if ( !el.closest(parent).length ) {
                    callback();
                    $('html').off(name);
                }
            });
        }
        setTimeout(set, 10);

        return {
            off: function () {
                $('html').off('click' + name + ' focus' + name);
            }
        };
    });

})();

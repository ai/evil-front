//= require evil-front/jquery

(function() {
    var lastId = 0;

    evil.$.extend('outside', function (callback) {
        var selector = this.selector;
        var name = '.evil-outside-' + lastId;
        lastId  += 1;

        $('html').on('click' + name + ' focus' + name, function(e) {
            var el = $(e.target);
            if ( !el.closest(selector).length ) {
                callback();
                $('html').off(name);
            }
        })
    });

})();

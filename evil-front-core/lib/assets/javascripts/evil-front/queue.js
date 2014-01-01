//= evil-front/core

(function() {
    // Call `callback` only after previous callback of `name` queue
    // will be finished. It is useful to animation.
    //
    // b.link.click ->
    //   evil.queue 'link', (done) ->
    //     $.get $(@).url, (html) ->
    //       animation html, ->
    //         done()
    evil.queue = function(name, callback) {
        if ( typeof(name) == 'function' ) {
            callback = name;
            name     = 'default';
        }

        if ( typeof(waiters[name]) == 'undefined' ) {
            waiting[name] = false;
            waiters[name] = [];
        }

        if ( waiting[name] ) {
            waiters[name].push(callback);
        } else {
            call(name, callback);
        }
    };

    var waiting = { };
    var waiters = { };

    var call = function(name, callback) {
        waiting[name] = true;
        callback(function () {
            waiting[name] = false;
            var waiter = waiters[name].pop();
            if ( waiter ) {
                call(name, waiter);
            }
        });
    };
})();

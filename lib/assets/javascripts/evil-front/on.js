//= require evil-front/core

// Isolate pages code by page selector.
// It will execute `callback` only if it find `selector` in document.
// Callback wil receive 3 arguments:
// * `$`: jQuery
// * `$$`: like jQuery, but find only inside `selector`.
// * `nodes`: nodes, which was find by `selector`.
//
//   evil.on '.user-page', ($, $$, page) ->
//     $$('@edit').click -> …
evil.on = function (selector, callback) {
    evil.doc.ready(function ($) {
        var part = $(selector);
        if ( !part.length ) {
            return;
        }

        var $$ = function (subselector) {
            return $(subselector, part);
        };
        callback.call(part, $, $$, part);
    });
};

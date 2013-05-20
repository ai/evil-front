//= require evil-front/core

// Add events to add special class on touch events. It will much faster, than
// `:hover` selector.
//
// Just load file and it will listen all touch events on `body`.
evil.doc.ready(function () {
    evil.body.on('touchstart', function (e) {
        e.target.classList.add('is-tapped');
        e.target.classList.remove('was-tapped');
    });
    evil.body.on('touchend touchmove', function (e) {
        $(e.target).
            removeClass('is-tapped').
            addClass('was-tapped').
            one('mouseenter', function () {
                e.target.classList.remove('was-tapped');
            });
    });
});

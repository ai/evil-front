//= require evil-front/jquery

// Add events to add special class on touch events. It will much faster, than
// `:hover` selector.
//
//   $('.styled-button').tappable()
evil.$.extend('tappable', function () {
    this.nodes.on('touchstart', function () {
        $(this).addClass('is-tapped');
    });
    this.nodes.on('touchend touchmove', function () {
        $(this).removeClass('is-tapped');
    });
});

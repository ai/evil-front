//= require evil-front/jquery

// Add events to add special class on touch events. It will much faster, than
// `:hover` selector. It returns jQuery node of element for chains.
//
// By default it add listener to all links and inputs on body.
// But you can add it to any elements:
//
//   $('.pseudolink').evil.tappable();
//
// Or you can set listeners as “live” delegate:
//
//   $('.ajax-updated').evil.tappable('.pseudolink');
//
// Don’t forget about `no-hover` and `styled-taps` Sass mixins.
(function () {
    var start = function () {
        this.classList.add('is-tapped');
    };
    var end = function () {
        var link = $(this);
        setTimeout(function () {
            link.removeClass('is-tapped').
                 addClass('was-tapped').
                 one('mouseenter', function () {
                     link.removeClass('was-tapped');
                 });
        }, 100);
    };

    evil.$.extend({
        tappable: function (selector) {
            if ( selector ) {
                this.on('touchstart', selector, start);
                this.on('touchend touchmove', selector, end);
            } else {
                this.on('touchstart', start);
                this.on('touchend touchmove', end);
            }
            return this;
        }
    });

    evil.doc.ready(function ($) {
        evil.body.evil.tappable('a, input, label');
    });
})();

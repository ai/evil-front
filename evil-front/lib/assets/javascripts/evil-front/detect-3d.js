//= require evil-front/core

// Detect support 3D transform and add `transform3d` or `transform2s` class
// to body.
evil.doc.ready(function () {
    var support   = typeof(evil.body.css('perspective')) != 'undefined';
    var bodyStyle = document.body;
    if ( support && typeof(bodyStyle.webkitPerspective) != 'undefined' ) {
      support = matchMedia("(transform-3d), (-webkit-transform-3d)").matches;
    }

    evil.body.addClass(support ? 'transform-3d' : 'transform-2d');
});

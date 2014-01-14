//= require evil-front/core
// Prevent default in AJAX link with only # in href

evil.doc.ready(function() {
    evil.body.on('click', 'a', function (e) {
        if ( this.getAttribute('href') == '#' ) {
            e.preventDefault();
        }
    });
})

// Prevent default in AJAX link with only # in href

evil.doc.ready(function() {
    evil.body.on('click', 'a', function (e) {
        if ( $(this).attr('href') == '#' ) {
            e.preventDefault();
        }
    });
})

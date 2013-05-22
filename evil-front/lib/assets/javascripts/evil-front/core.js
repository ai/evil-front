// Add global `evil` namespace and common shortcuts.

if ( !window.evil ) {
    window.evil = { };
}

evil.win  = $(window),
evil.doc  = $(document),
evil.body = null;

evil.doc.ready(function() {
    evil.body = $('body');
});

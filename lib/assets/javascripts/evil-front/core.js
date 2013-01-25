// Add global `evil` namespace and common shortcuts.

window.evil = {
    win:  $(window),
    doc:  $(document),
    body: null
};

evil.doc.ready(function() {
    evil.body = $('body');
});

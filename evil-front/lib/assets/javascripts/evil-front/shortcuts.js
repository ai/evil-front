//= require evil-front/core

evil.win  = $(window),
evil.doc  = $(document),
evil.body = null;

evil.doc.ready(function() {
    evil.body = $('body');
});

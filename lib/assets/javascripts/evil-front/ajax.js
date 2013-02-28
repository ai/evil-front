//= evil-front/jquery

evil.$.extend('ajax', function (opts) {
    if ( !opts ) {
        opts = { };
    }

    this.submit(function () {
        form = $(this);

        if ( form.hasClass('is-submiting') ) {
            return false;
        }
        form.addClass('is-submiting');

        $.ajax({
            url:  form.attr('action'),
            type: form.attr('method').toUpperCase(),
            data: form.serialize(),
            success: function () {
                if ( opts.success ) {
                    opts.success(form);
                }
            },
            error: function (e) {
                if ( e.status != 500 && opts.error ) {
                    opts.error(e.responseText, form);
                }
            },
            complete: function () {
                form.removeClass('is-submiting');
            }
        });

        return false;
    });
});

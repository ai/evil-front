//= evil-front/jquery

// Change selected form to be sent by AJAX.
// It returns jQuery node of form for chains.
//
//   $('form').evil.ajax
//     success:      -> message('success')
//     error: (text) -> message('error' + text)
//
// While AJAX is loading, form will has `is-submitting` class.
// Don’t forget to show loader.
evil.$.extend('ajax', function (opts) {
    if ( !opts ) {
        opts = { };
    }

    return this.submit(function (event) {
        if ( event.isPropagationStopped() ) {
            return false;
        }

        var form = $(this);

        if ( form.hasClass('is-submitting') ) {
            return false;
        }
        form.addClass('is-submitting');

        var check = true;
        if ( opts.submitting ) {
            check = opts.submitting(form);
        }
        if ( !check ) {
            return false;
        }

        $.ajax({
            url:  form.attr('action'),
            type: form.attr('method').toUpperCase(),
            data: form.serialize(),
            success: function (data) {
                if ( opts.success ) {
                    opts.success(data, form);
                }
            },
            error: function (e) {
                if ( e.status == 500 ) {
                    if ( opts.serverError ) {
                        opts.serverError(form);
                    }
                } else if ( opts.error ) {
                    opts.error(e.responseText, form);
                }
            },
            complete: function () {
                form.removeClass('is-submitting');
            }
        });

        return false;
    });
});

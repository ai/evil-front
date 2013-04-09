//= require evil-front/core
// Add `evil.patch`, `evil.del`, `evil.put`, `evil.post` to send AJAX request
// with RESTful HTTP verb by Rails X-HTTP-Method-Override header
// and with CSRF token.

(function($) {
    var props = { patch: 'PATCH', put: 'PUT', del: 'DELETE', post: 'POST' }
    $.each(props, function(prop, method) {
        evil[prop] = function(url, data, callback, type) {
            if ($.isFunction(data)) {
                type = type || callback;
                callback = data;
                data = { };
            }

            return $.ajax({
                headers: {
                    'X-HTTP-Method-Override': method,
                    'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
                },
                type:    'POST',
                url:     url,
                data:    data,
                success: callback,
                dataType: type
            });
        }
    })
})(jQuery);

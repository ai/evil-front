//= require evil-front/core
// Add `evil.patch`, `evil.del`, `evil.put` to send AJAX request with RESTful
// HTTP verb by Rails X-HTTP-Method-Override header.

(function($) {
    var props = { patch: 'PATCH', put: 'PUT', del: 'DELETE' }
    $.each(props, function(prop, method) {
        evil[prop] = function(url, data, callback, type) {
            if ($.isFunction(data)) {
                type = type || callback;
                callback = data;
                data = { };
            }

            return $.ajax({ headers: { 'X-HTTP-Method-Override': method },
                            type:    'POST',
                            url:     url,
                            data:    data,
                            success: callback,
                            dataType: type });
        }
    })
})(jQuery);

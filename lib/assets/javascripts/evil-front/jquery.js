//= require evil-front/core

// Namespace inside jQuery.
evil.$ = function (nodes) {
    this.nodes = nodes;
};

// Syntax sugar to add own method to `$.fn.evil`.
evil.$.extend = function (name, value) {
    evil.$.prototype[name] = value;
};

// Hack to add `$.fn.evil` namespace.
(function ($) {
  var originaljQuery = $.fn.init;
  $.fn.init = function () {
      nodes = originaljQuery.apply(this, arguments);
      nodes.evil = new evil.$(nodes);
      return nodes;
  };
  $.fn.init.prototype = originaljQuery.prototype;
})(jQuery);

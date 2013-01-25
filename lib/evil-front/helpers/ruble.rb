# encoding: utf-8

module EvilFront::Helpers
  # Insert symbol of Russian currency.
  #
  #   = order.price
  #   = ruble
  #
  # Don’t forget to import ruble’s fonts and class in you Sass:
  #
  #   +import-ruble("PT Sane, sans-serif", $regular: inline)
  def ruble
    '<span class="ruble">Р</span>'.html_safe
  end
end

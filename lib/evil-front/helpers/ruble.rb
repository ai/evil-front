# encoding: utf-8

module EvilFront::Helpers
  # Insert symbol of Russian currency.
  #
  #   = order.price
  #   = ruble
  def ruble
    '<span class="ruble">Р</span>'.html_safe
  end
end

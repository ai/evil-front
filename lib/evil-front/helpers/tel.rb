# encoding: utf-8

module EvilFront::Helpers
  # Render link with phone number. It will remove all non-digits symbols from
  # phone number and format `tel:` protocol URI.
  #
  #   label Contact us:
  #   = tel('+7 (495) 660−83−79')
  def tel(number)
    href = "tel:" + number.gsub(/[^\d\+]/, '')
    content_tag(:a, number, href: href, class: 'tel')
  end
end

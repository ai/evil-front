module EvilFront::Helpers
  # Render link with phone number. It will remove all non-digits symbols from
  # phone number and format `tel:` protocol URI.
  #
  #   label Contact us:
  #   = tel('+7 (495) 660−83−79')
  def tel(number, args = { })
    args[:href]  = "tel:" + number.gsub(/[^\d\+]/, '')
    args[:class] = (['tel', args[:class]]).compact.join(' ')
    content_tag(:a, number, args)
  end
end

module EvilFront::Helpers
  # Add typograph rules to text by language in current locale.
  #
  #   typograph_by_locale(post.body)
  def typograph_by_locale(text = nil, &block)
    text = capture(&block) if block_given?

    if I18n.locale == :ru
      russian_typograph(text)
    elsif I18n.locale == :en
      english_typograph(text)
    else
      text
    end
  end
end

module EvilFront::Helpers
  # Insert non-break spaces and mark quotes to have nice text.
  # Work only with English language.
  #
  #   = english_typograph user.description
  #
  # You can send block:
  #
  #   = english_typograph do
  #     = user.name
  #     = user.profession
  def english_typograph(text = nil, &block)
    text = if block_given?
      capture(&block)
    else
      EvilFront.escape(text)
    end
    text = EvilFront::English.typograph_html(text)
    EvilFront.html_safe(text)
  end
end

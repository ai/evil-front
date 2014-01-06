module EvilFront::Helpers
  # Insert non-break spaces and mark quotes to have nice text. Work only with
  # Russian language.
  #
  #   = typograph user.description
  #
  # You can send block:
  #
  #   = typograph do
  #     = user.name
  #     = user.profession
  def russian_typograph(text = nil, &block)
    text = capture(&block) if block_given?
    text = EvilFront.escape(text)
    text = EvilFront::Russian.typograph_html(text)
    EvilFront.html_safe(text)
  end
end

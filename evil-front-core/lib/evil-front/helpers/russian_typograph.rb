# encoding: utf-8

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
    text = raw(text) if respond_to? :raw
    text = EvilFront::Russian.typograph_html(text)
    EvilFront.html_safe(text)
  end
end

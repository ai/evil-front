module EvilFront::Helpers
  # Mark quotes to move first quote before the text line.
  #
  #   = flying_quotes feedback.text
  #
  # You can send block:
  #
  #   = flying_quotes do
  #     a href=course.url
  #       = course.name
  def flying_quotes(text = nil, options = { }, &block)
    text = capture(&block).strip if block_given?
    text = raw(text) if respond_to? :raw
    text = EvilFront::Russian.flying_quotes(text, options)
    EvilFront.html_safe(text)
  end
end

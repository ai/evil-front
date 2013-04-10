# encoding: utf-8

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
    text  = capture(&block).strip if block_given?
    space = options[:space] || ' '
    ('<span class="space-before-quote">' + space + '</span>' +
     '<span class="quotes">«' + raw(text) + '»</span> ').html_safe
  end
end

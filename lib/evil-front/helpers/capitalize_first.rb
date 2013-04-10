# encoding: utf-8

module EvilFront::Helpers
  # Capitalize only first letter (like titles in Russian).
  #
  #   = capitalize_first post.title
  def capitalize_first(text)
    UnicodeUtils.upcase(text[0]) + text[1..-1]
  end
end

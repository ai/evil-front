module EvilFront::Helpers
  # Capitalize only first letter (like titles in Russian).
  #
  #   = capitalize_first post.title
  def capitalize_first(text)
    EvilFront::Russian.capitalize_first(text)
  end
end

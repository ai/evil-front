module EvilFront::Helpers
  # Find quotes and add tags to flying quotes
  #
  #   = auto_flying_quotes post.body
  def auto_flying_quotes(text = nil, &block)
    text = if block_given?
      capture(&block).strip
    else
      EvilFront.escape(text)
    end
    text = EvilFront::Russian.auto_flying_quotes(text)
    EvilFront.html_safe(text)
  end
end

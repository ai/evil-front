module EvilFront::Helpers
  # Add content to head tag. Will be useful in page views.
  #
  #   - head_content do
  #     meta name="description" content=page.seo.description
  #     meta name="keywords"    content=page.seo.keywords
  def head_content(&block)
    content_for(:evil_front_head, &block)
  end
end

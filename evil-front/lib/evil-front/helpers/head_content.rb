# encoding: utf-8

module EvilFront::Helpers
  # Add content to head tag. Will be useful in page views.
  #
  #   - head_content do
  #     meta name="description" content=page.seo.description
  #     meta name="keywords"    content=page.seo.keywords
  def head_content(&block)
    @evil_front_head ||= ''
    @evil_front_head  += capture(&block)
  end
end

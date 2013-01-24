# encoding: utf-8

module EvilFront::Helpers
  # Add page title. Will be used with site title in document title tag by
  # `title_tag`.
  #
  #   - title 'FAQ'
  #
  # You can set subtitles (order will be reversed):
  #
  #   - title 'FAQ', 'Ask'
  def title(*titles)
    @evil_front_titles ||= []
    @evil_front_titles  += titles
  end
end

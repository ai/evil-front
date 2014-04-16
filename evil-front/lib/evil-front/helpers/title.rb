module EvilFront::Helpers
  # Add page title. Will be used with site title in document title tag by
  # `title_tag`.
  #
  #   - title 'FAQ'
  #
  # You can set subtitles (order will be reversed):
  #
  #   - title 'FAQ', 'Ask'
  #
  # By default `title_tag` will add site name to page title. You can show only
  # page title by `no_site` option:
  #
  #   - title 'Site Home', no_site: true
  def title(*titles)
    options = titles.extract_options!
    @evil_front_no_site_in_title = true if options[:no_site]

    @evil_front_titles ||= []
    @evil_front_titles  += titles
  end
end

# encoding: utf-8

module EvilFront::Helpers
  # Add `application.css`, jQuery from Google CDN and `application.js`.
  #
  #   html
  #     head
  #       = standard_assets
  def standard_assets(attributes = { })
    stylesheet_link_tag('application', media: 'all') +
      include_jquery(attributes) +
      content_for(:evil_libraries) +
      javascript_include_tag('application', attributes)
  end
end

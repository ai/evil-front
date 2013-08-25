# encoding: utf-8

module EvilFront::Helpers
  # Add `application.css`, jQuery from Google CDN and `application.js`.
  #
  #   html
  #     head
  #       = standard_assets
  def standard_assets
    stylesheet_link_tag('application', media: 'all') +
      include_jquery(defer: true) +
      content_for(:evil_libraries) +
      javascript_include_tag('application', defer: true)
  end
end

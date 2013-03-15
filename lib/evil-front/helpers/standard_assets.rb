# encoding: utf-8

module EvilFront::Helpers
  # Add `application.css`, jQuery from Google CDN and `application.js`.
  #
  #   html
  #     head
  #       = standard_assets
  def standard_assets
    stylesheet_link_tag('application', media: 'all') +
      jquery_include_tag(:google, deferer: true) +
      javascript_include_tag('application', deferer: true)
  end
end

# encoding: utf-8

module EvilFront::Helpers
  # Disable user zoom in mobile browsers. You should use it only if your styles
  # are special optimized for mobile screens.
  #
  #   html
  #     head
  #       = disable_mobile_zoom
  def disable_mobile_zoom
    viewport = 'width=device-width, initial-scale=1'
    html     = '<meta name="viewport" content="' + viewport + '" />'
    EvilFront.html_safe(html)
  end
end

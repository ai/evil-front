# encoding: utf-8

module EvilFront::Helpers
  # Disable user zoom in mobile browsers. You should use it only if your styles
  # are special optimized for mobile screens.
  #
  #   html
  #     head
  #       = disable_mobile_zoom
  def disable_mobile_zoom
    ('<meta name="viewport" content="width=device-width, initial-scale=1.0, ' +
      'maximum-scale=1.0, user-scalable=0" />').html_safe
  end
end

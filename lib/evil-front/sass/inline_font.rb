# encoding: utf-8

module EvilFront::Sass
  # Inline font. Instead of Compass’s `inline-font-files` this function take
  # font path from Assets Pipeline and can be used for `vendor/assets`.
  #
  #   @font-face
  #     font-family: "MyFont"
  #     src: inline-font("my.woff")
  #
  # By default, it will inline woff font, for another types you need to set
  # `mime` argument.
  def inline_font(path, mime = 'application/x-font-woff')
    path = path.value

    asset = Rails.application.assets[path]
    raise "Unknow font #{path}" unless asset

    font = asset.pathname.read
    font = [font].flatten.pack('m').gsub("\n", '')
    font = "url('data:#{mime};base64,#{font}')"

    format = path.match(/\.([^\.]*)$/)[1]
    Sass::Script::String.new("#{font} format('#{format}')")
  end
end

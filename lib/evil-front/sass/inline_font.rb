# encoding: utf-8

module EvilFront::Sass
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

# encoding: utf-8
# Load Sass extensions

dir = Pathname(__FILE__).dirname.join('sass')
Dir.glob(dir.join('*.rb').to_s) { |ext| require ext }

module Sass::Script::Functions
  include EvilFront::Sass
end

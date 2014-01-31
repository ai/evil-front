require File.expand_path('../lib/evil-front/version', __FILE__)

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'evil-front'
  s.version     = EvilFront::VERSION
  s.date        = Time.now.strftime('%Y-%m-%d')
  s.summary     = 'Helpers, Sass mixins and JS shortcuts from Evil Martians'

  s.author   = 'Andrey Sitnik'
  s.email    = 'andrey@sitnik.ru'
  s.homepage = 'https://github.com/ai/evil-front'
  s.license  = 'MIT'

  s.files            = `git ls-files`.split("\n")
  s.extra_rdoc_files = ['LICENSE']
  s.require_path     = 'lib'

  s.add_dependency 'i18n',                '>= 0'
  s.add_dependency 'slim',                '>= 1.3.9'
  s.add_dependency 'sass',                '>= 3.2.9'
  s.add_dependency 'nokogiri',            '>= 1'
  s.add_dependency 'sprockets',           '>= 1'
  s.add_dependency 'unicode_utils',       '>= 1.4'
  s.add_dependency 'rubypants-unicode',   '>= 0'
  s.add_dependency 'rails-sass-images',   '>= 0.3'
  s.add_dependency 'standalone_typograf', '>= 3.0.1'
end

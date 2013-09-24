# encoding: utf-8

require './lib/evil-front/version'

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'evil-front'
  s.version     = EvilFront::VERSION.dup
  s.date        = Time.now.strftime('%Y-%m-%d')
  s.summary     = ''
  s.description = <<-EOF
  EOF

  s.author   = 'Andrey "A.I." Sitnik'
  s.email    = 'andrey@sitnik.ru'
  s.homepage = 'https://github.com/ai/evil-front'
  s.license  = 'MIT'

  s.files            = `git ls-files`.split("\n")
  s.extra_rdoc_files = ['LICENSE']
  s.require_path     = 'lib'

  s.add_dependency 'sass',                '>= 3.2.9'
  s.add_dependency 'slim',                '>= 1.3.9'
  s.add_dependency 'uglifier',            '>= 2.1.1'
  s.add_dependency 'sprockets',           '>= 1'
  s.add_dependency 'csso-rails',          '>= 0.3'
  s.add_dependency 'jquery-cdn',          '>= 1'
  s.add_dependency 'coffee-script',       '>= 2.2.0'
  s.add_dependency 'unicode_utils',       '>= 1.4'
  s.add_dependency 'rails-sass-images',   '>= 0.3'
  s.add_dependency 'evil-blocks-rails',   '>= 0.2'
  s.add_dependency 'autoprefixer-rails',  '>= 0.5'
  s.add_dependency 'standalone_typograf', '>= 2'
end

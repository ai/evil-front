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

  s.files            = `git ls-files`.split("\n")
  s.extra_rdoc_files = ['README.md', 'LICENSE']
  s.require_path     = 'lib'

  s.add_dependency 'rails',              '>= 3'
  s.add_dependency 'uglifier',           '>= 1.3.0'
  s.add_dependency 'sass-rails',         '>= 3.2.6'
  s.add_dependency 'slim-rails',         '>= 1.1.0'
  s.add_dependency 'role-rails',         '>= 1.3.1'
  s.add_dependency 'coffee-rails',       '>= 3.2.2'
  s.add_dependency 'unicode_utils',      '>= 1.4'
  s.add_dependency 'jquery-rails-cdn',   '>= 0.3'
  s.add_dependency 'rails-sass-images',  '>= 0.1'
  s.add_dependency 'autoprefixer-rails', '>= 0.1'
end

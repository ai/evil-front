require File.expand_path('../lib/evil-front/all/version', __FILE__)

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'evil-front-all'
  s.version     = EvilFront::All::VERSION
  s.date        = Time.now.strftime('%Y-%m-%d')
  s.summary     = 'Helpers, Sass mixins, JS shortcuts and workflow ' +
                  'from Evil Martians'

  s.author   = 'Andrey Sitnik'
  s.email    = 'andrey@sitnik.ru'
  s.homepage = 'https://github.com/ai/evil-front'
  s.license  = 'MIT'

  s.files            = `git ls-files`.split("\n")
  s.extra_rdoc_files = ['LICENSE']
  s.require_path     = 'lib'

  min = EvilFront::All::VERSION.split('.')[0..1].concat(['0']).join('.')
  s.add_runtime_dependency 'evil-front', "~> #{min}"

  s.add_dependency 'uglifier',            '>= 2.1.1'
  s.add_dependency 'sprockets',           '>= 1'
  s.add_dependency 'csso-rails',          '>= 0.3'
  s.add_dependency 'jquery-cdn',          '>= 1'
  s.add_dependency 'coffee-script',       '>= 2.2.0'
  s.add_dependency 'evil-blocks-rails',   '>= 0.2'
  s.add_dependency 'autoprefixer-rails',  '>= 0.5'
end

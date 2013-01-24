# encoding: utf-8

require './lib/evil/front/version'

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
end

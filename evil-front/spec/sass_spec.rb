require_relative 'spec_helper'

describe 'Sass Helpers' do
  before(:all) do
    @assets = Sprockets::Environment.new
    @assets.append_path File.expand_path('../sass', __FILE__)
    EvilFront.install(@assets)

    @assets.context_class.class_eval do
       def asset_path(path, options = {})
        ''
       end
     end
  end

  it 'loads Rails Sass Images' do
    expect(@assets['load'].to_s).to match(/data:text\/plain/)
  end

  it 'loads variables, functions and mixins' do
    load = @assets['load'].to_s
    expect(load).to match(/rgba\(0, 0, 0, 0.5\)/)
    expect(load).to match(/cubic-bezier\(0.47, 0, 0.745, 0.715\)/)
    expect(load).to match(/a:after/)
  end

  describe '+import-ruble' do

    it 'adds font-faces and .ruble' do
      ruble = @assets['ruble'].to_s
      expect(ruble).to match(/font-family: ALSRubl-Arial, PT Sans, sans-serif/)
      expect(ruble).not_to match(/font-woff;base64/)
    end

    it 'inlines specified fonts' do
      ruble = @assets['inline-ruble'].to_s
      expect(ruble).to match(/font-style: italic;\s*src: url\('data/n)
    end

  end

  describe 'media mixins' do
    before(:all) do
      @media = @assets['media'].to_s
    end

    it 'receives size without units' do
      expect(@media).to match(/max-width: 100px/)
    end

    it 'receives size with units' do
      expect(@media).to match(/min-width: 200px/)
    end

  end

  describe '+size' do
    before(:all) do
      @size = @assets['size'].to_s
    end

    it 'receives 2 sizes' do
      expect(@size).to match(/.all {\s*width: 10px;\s*height: 20px; }/)
    end

    it 'receives 1 sizes' do
      expect(@size).to match(/.one {\s*width: 30px;\s*height: 30px; }/)
    end

    it 'receives size without unit' do
      expect(@size).to match(/.no-unit {\s*width: 15px;\s*height: 15px; }/)
    end

  end
end

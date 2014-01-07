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
    @assets['load'].to_s.should =~ /data:text\/plain/
  end

  it 'loads variables, functions and mixins' do
    load = @assets['load'].to_s
    load.should =~ /rgba\(0, 0, 0, 0.5\)/
    load.should =~ /cubic-bezier\(0.47, 0, 0.745, 0.715\)/
    load.should =~ /a:after/
  end

  describe '+import-ruble' do

    it 'adds font-faces and .ruble' do
      ruble = @assets['ruble'].to_s
      ruble.should =~ /font-family: ALSRubl-Arial, PT Sans, sans-serif/
      ruble.should_not =~ /font-woff;base64/
    end

    it 'inlines specified fonts' do
      ruble = @assets['inline-ruble'].to_s
      ruble.should =~ /font-style: italic;\s*src: url\('data/n
    end

  end

  describe 'media mixins' do
    before(:all) do
      @media = @assets['media'].to_s
    end

    it 'receives size without units' do
      @media.should =~ /max-width: 100px/
    end

    it 'receives size with units' do
      @media.should =~ /min-width: 200px/
    end

  end

  describe '+size' do
    before(:all) do
      @size = @assets['size'].to_s
    end

    it 'receives 2 sizes' do
      @size.should =~ /.all {\s*width: 10px;\s*height: 20px; }/
    end

    it 'receives 1 sizes' do
      @size.should =~ /.one {\s*width: 30px;\s*height: 30px; }/
    end

    it 'receives size without unit' do
      @size.should =~ /.no-unit {\s*width: 15px;\s*height: 15px; }/
    end

  end
end

# encoding: utf-8

require_relative 'spec_helper'

describe HelpersController, type: :controller do
  render_views

  describe 'flying_quotes' do

    it 'accepts blocks' do
      get :flying_quotes
      expect(response).to be_success
      expect(response.body).to eq '<span class="space-before-quote"> </span>' +
                                  '<span class="quotes">«<b>text</b>»</span>'
    end

  end

  describe 'auto_flying_quotes' do

    it 'accepts blocks' do
      get :auto_flying_quotes
      expect(response).to be_success
      expect(response.body).to eq '<b><span class="quotes">«a»</span></b>'
    end

  end

  describe 'russian_typograph' do

    it 'accepts blocks' do
      get :russian_typograph
      expect(response).to be_success
      expect(response.body).to eq '<b>«&lt;ф&gt;»</b>'
    end

  end

  describe 'typograph_by_locale' do
    after do
      I18n.locale = :en
    end

    it 'accepts blocks' do
      get :typograph_by_locale
      expect(response).to be_success
      expect(response.body).to eq '“a”'
    end

    it 'returns origin blocks on unknown locale' do
      I18n.locale = :fr
      get :typograph_by_locale
      expect(response).to be_success
      expect(response.body).to eq '&quot;a&quot;'
    end

  end

  describe 'head_tag' do
    before do
      @env = Rails.env
    end

    after do
      Rails.env = @env
    end

    it 'generates head tag content' do
      get :head
      expect(response).to be_success
      expect(response.body).to eq '<head><meta charset="UTF-8" />' +
                                  '<title>1</title><style>a {}</style></head>'
    end

    it 'adds statistics in production' do
      Rails.env = ActiveSupport::StringInquirer.new('production')
      get :head
      expect(response).to be_success
      expect(response.body).to eq '<head><meta charset="UTF-8" />' +
                                    '<title>1</title>' +
                                    "<style>a {}</style>stat\n</head>"
    end

    it 'ignores statistics on demand' do
      Rails.env = ActiveSupport::StringInquirer.new('production')
      get :unstat
      expect(response).to be_success
      expect(response.body).to eq '<head><meta charset="UTF-8" />' +
                                  '<title>2</title></head>'
    end

  end

  describe 'standard_assets' do

    it 'includes links' do
      Rails.env = ActiveSupport::StringInquirer.new('development')
      get :standard_assets
      expect(response).to be_success
      expect(response.body).to eq(
        '<link href="/stylesheets/application.css" ' +
              'media="all" rel="stylesheet" />' +
        '<script src="/assets/jquery.js"></script>' +
        '<script src="/javascripts/application.js"></script>')
    end

    it 'includes CDN jQuery' do
      Rails.env = ActiveSupport::StringInquirer.new('production')
      get :standard_assets
      expect(response).to be_success
      expect(response.body).to eq(
        '<link href="/stylesheets/application.css" ' +
              'media="all" rel="stylesheet" />' +
        '<script src="//ajax.googleapis.com/ajax/libs/jquery/' +
                     "#{ JqueryCdn::VERSION }/jquery.min.js\"></script>" +
        "<script>window.jQuery || " +
                "document.write(unescape('%3Cscript " +
                "src=\"/assets/jquery.js\">%3C/script>'))</script>" +
        '<script src="/javascripts/application.js"></script>')
    end

    it 'includes additional libraries' do
      Rails.env = ActiveSupport::StringInquirer.new('development')
      get :library
      expect(response).to be_success
      expect(response.body).to eq(
        '<link href="/stylesheets/application.css" ' +
              'media="all" rel="stylesheet" />' +
        '<script src="/assets/jquery.js"></script>' +
        '<link src="a" />' +
        '<script src="/javascripts/application.js"></script>')
    end

  end

  describe 'tel' do

    it 'renders telephone link' do
      get :tel
      expect(response).to be_success
      expect(response.body).to eq '<a class="tel phone" data-role="call" ' +
                                  'href="tel:+555">+5 55</a>'
    end

  end

end

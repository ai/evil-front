# encoding: utf-8

require_relative 'spec_helper'

describe HelpersController, type: :controller do
  render_views

  describe 'flying_quotes' do

    it 'accepts blocks' do
      get :flying_quotes
      response.should be_success
      response.body.should == '<span class="space-before-quote"> </span>' +
                              '<span class="quotes">«<b>text</b>»</span>'
    end

  end

  describe 'russian_typograph' do

    it 'accepts blocks' do
      get :russian_typograph
      response.should be_success
      response.body.should == '<b><span class="quotes">«&lt;ф&gt;»</span></b>'
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
      response.should be_success
      response.body.should == '<head><meta charset="UTF-8" />' +
                              '<title>1</title><style>a {}</style></head>'
    end

    it 'adds statistics in production' do
      Rails.env = ActiveSupport::StringInquirer.new('production')
      get :head
      response.should be_success
      response.body.should == '<head><meta charset="UTF-8" />' +
                              "<title>1</title><style>a {}</style>stat\n</head>"
    end

    it 'ignores statistics on demand' do
      Rails.env = ActiveSupport::StringInquirer.new('production')
      get :unstat
      response.should be_success
      response.body.should == '<head><meta charset="UTF-8" />' +
                              '<title>2</title></head>'
    end

  end

  describe 'standard_assets' do

    it 'includes links' do
      Rails.env = ActiveSupport::StringInquirer.new('development')
      get :standard_assets
      response.should be_success
      response.body.should ==
        '<link href="/stylesheets/application.css" ' +
              'media="all" rel="stylesheet" />' +
        '<script src="/assets/jquery.js"></script>' +
        '<script src="/javascripts/application.js"></script>'
    end

    it 'includes CDN jQuery' do
      Rails.env = ActiveSupport::StringInquirer.new('production')
      get :standard_assets
      response.should be_success
      response.body.should ==
        '<link href="/stylesheets/application.css" ' +
              'media="all" rel="stylesheet" />' +
        '<script src="//ajax.googleapis.com/ajax/libs/' +
                     'jquery/2.0.3/jquery.min.js"></script>' +
        "<script>window.jQuery || " +
                "document.write(unescape('%3Cscript " +
                "src=\"/assets/jquery.js\">%3C/script>'))</script>" +
        '<script src="/javascripts/application.js"></script>'
    end

    it 'includes additional libraries' do
      Rails.env = ActiveSupport::StringInquirer.new('development')
      get :library
      response.should be_success
      response.body.should ==
        '<link href="/stylesheets/application.css" ' +
              'media="all" rel="stylesheet" />' +
        '<script src="/assets/jquery.js"></script>' +
        '<link src="a" />' +
        '<script src="/javascripts/application.js"></script>'
    end

  end

  describe 'tel' do

    it 'renders telephone link' do
      get :tel
      response.should be_success
      response.body.should == '<a class="tel phone" data-role="call" ' +
                                 'href="tel:+555">+5 55</a>'
    end

  end

end

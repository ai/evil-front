require_relative 'spec_helper'

describe HelpersController, type: :controller do
  render_views

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

  describe 'tel' do

    it 'renders telephone link' do
      get :tel
      response.should be_success
      response.body.should == '<a class="tel phone" data-role="call" ' +
                                 'href="tel:+555">+5 55</a>'
    end

  end

end

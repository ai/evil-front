require_relative 'spec_helper'

describe HelpersController, type: :controller do
  render_views

  describe 'head_tag' do

    it 'generates head tag content' do
      get :head
      response.should be_success
      response.body.should == "<head><meta charset=\"UTF-8\" />" +
                              "<title>1</title><style>a {}</style></head>"
    end

  end

end

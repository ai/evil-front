# encoding: utf-8

require_relative 'spec_helper'
require 'slim'

describe EvilFront::Helpers do
  include EvilFront::Helpers

  describe 'capitalize_first' do

    it 'capitalizes Russian' do
      capitalize_first('тест').should == 'Тест'
    end

  end

  describe 'disable_mobile_zoom' do

    it 'returns viewport meta tag' do
      disable_mobile_zoom.should =~ /^<meta name="viewport" /
    end

  end

  describe 'flying_quotes' do

    it 'set quotes to text' do
      flying_quotes('a').should == '<span class="space-before-quote"> </span>' +
                                   '<span class="quotes">«a»</span>'
    end

  end

  describe 'ruble' do

    it 'returns span' do
      ruble.should be_a(String)
    end

  end

  describe 'russian_typograph' do

    it 'typograps text inside tags' do
      russian_typograph('<a title="а - б">а - б</a>').should ==
        '<a title="а - б">а — б</a>'
    end

  end

end

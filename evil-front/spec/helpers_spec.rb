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

    it 'escapes HTML' do
      flying_quotes('<br>').should ==
        '<span class="space-before-quote"> </span>' +
        '<span class="quotes">«&lt;br&gt;»</span>'
    end

  end

  describe 'auto_flying_quotes' do

    it 'set quotes to text' do
      auto_flying_quotes('от «a»').should ==
        'от<span class="space-before-quote"> </span>' +
        '<span class="quotes">«a»</span>'
    end

    it 'escapes HTML' do
      auto_flying_quotes('от «<br>»').should ==
        'от<span class="space-before-quote"> </span>' +
        '<span class="quotes">«&lt;br&gt;»</span>'
    end

  end

  describe 'ruble' do

    it 'returns span' do
      ruble.should be_a(String)
    end

  end

  describe 'russian_typograph' do

    it 'typographs text inside tags' do
      tag = '<a title="а...">а...</a>'.html_safe
      russian_typograph(tag).should == '<a title="а...">а…</a>'
    end

    it 'escapes HTML' do
      russian_typograph('<a>').should == '&lt;a&gt;'
    end

  end

  describe 'english_typograph' do

    it 'typographs text inside tags' do
      tag = '<a title="a...">a...</a>'.html_safe
      english_typograph(tag).should == '<a title="a...">a…</a>'
    end

    it 'escapes HTML' do
      english_typograph('<a>').should == '&lt;a&gt;'
    end

  end

  describe 'typograph_by_locale' do
    after do
      I18n.locale = :en
    end

    it 'typographs by current locale' do
      I18n.locale = :en
      typograph_by_locale('"a"').should == '“a”'

      I18n.locale = :ru
      typograph_by_locale('"a"').should == '«a»'
    end

    it 'returns origin text on unknown locale' do
      I18n.locale = :fr
      typograph_by_locale('"a"').should == '"a"'
    end

  end

  describe 'title' do
    after do
      I18n.locale = :en
      @evil_front_titles = nil
    end

    it 'shows site name' do
      title_tag('Site').should == '<title>Site</title>'
    end

    it 'shows site names' do
      title_tag('One', 'Two').should == '<title>One - Two</title>'
    end

    it 'shows page name' do
      title 'Page', 'Section'
      title_tag('Site').should == '<title>Page - Section - Site</title>'
    end

    it 'shows Russian separator' do
      I18n.locale = :ru
      title 'Страница', 'Раздел'
      title_tag('Сайт').should == '<title>Страница — Раздел — Сайт</title>'
    end

    it 'shows custom separator' do
      title 'One', 'Two'
      title_tag(separator: ' | ').should == '<title>One | Two</title>'
    end

    it 'escapes HTML' do
      title '<B>'
      title_tag.should == '<title>&lt;B&gt;</title>'
    end

    it 'hides site name on request' do
      title 'Page', no_site: true
      title_tag('Site').should == '<title>Page</title>'
    end

  end

end

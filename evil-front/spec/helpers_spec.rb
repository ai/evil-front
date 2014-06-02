# encoding: utf-8

require_relative 'spec_helper'
require 'slim'

describe EvilFront::Helpers do
  include EvilFront::Helpers

  describe 'capitalize_first' do

    it 'capitalizes Russian' do
      expect(capitalize_first('тест')).to eq 'Тест'
    end

  end

  describe 'disable_mobile_zoom' do

    it 'returns viewport meta tag' do
      expect(disable_mobile_zoom).to match(/^<meta name="viewport" /)
    end

  end

  describe 'flying_quotes' do

    it 'set quotes to text' do
      expect(flying_quotes('a')).to eq(
        '<span class="space-before-quote"> </span>' +
        '<span class="quotes">«a»</span>')
    end

    it 'escapes HTML' do
      expect(flying_quotes('<br>')).to eq(
        '<span class="space-before-quote"> </span>' +
        '<span class="quotes">«&lt;br&gt;»</span>')
    end

  end

  describe 'auto_flying_quotes' do

    it 'set quotes to text' do
      expect(auto_flying_quotes('от «a»')).to eq(
        'от<span class="space-before-quote"> </span>' +
        '<span class="quotes">«a»</span>')
    end

    it 'escapes HTML' do
      expect(auto_flying_quotes('от «<br>»')).to eq(
        'от<span class="space-before-quote"> </span>' +
        '<span class="quotes">«&lt;br&gt;»</span>')
    end

  end

  describe 'ruble' do

    it 'returns span' do
      expect(ruble).to be_a(String)
    end

  end

  describe 'russian_typograph' do

    it 'typographs text inside tags' do
      tag = '<a title="а...">а...</a>'.html_safe
      expect(russian_typograph(tag)).to eq'<a title="а...">а…</a>'
    end

    it 'escapes HTML' do
      expect(russian_typograph('<a>')).to eq '&lt;a&gt;'
    end

  end

  describe 'english_typograph' do

    it 'typographs text inside tags' do
      tag = '<a title="a...">a...</a>'.html_safe
      expect(english_typograph(tag)).to eq '<a title="a...">a…</a>'
    end

    it 'escapes HTML' do
      expect(english_typograph('<a>')).to eq '&lt;a&gt;'
    end

  end

  describe 'typograph_by_locale' do
    after do
      I18n.locale = :en
    end

    it 'typographs by current locale' do
      I18n.locale = :en
      expect(typograph_by_locale('"a"')).to eq '“a”'

      I18n.locale = :ru
      expect(typograph_by_locale('"a"')).to eq '«a»'
    end

    it 'returns origin text on unknown locale' do
      I18n.locale = :fr
      expect(typograph_by_locale('"a"')).to eq '"a"'
    end

  end

  describe 'title' do
    after do
      I18n.locale = :en
      @evil_front_titles = nil
    end

    it 'shows site name' do
      expect(title_tag('Site')).to eq '<title>Site</title>'
    end

    it 'shows site names' do
      expect(title_tag('One', 'Two')).to eq '<title>One - Two</title>'
    end

    it 'shows page name' do
      title 'Page', 'Section'
      expect(title_tag('Site')).to eq '<title>Page - Section - Site</title>'
    end

    it 'shows Russian separator' do
      I18n.locale = :ru
      title 'Страница', 'Раздел'
      expect(title_tag('Сайт')).to eq '<title>Страница — Раздел — Сайт</title>'
    end

    it 'shows custom separator' do
      title 'One', 'Two'
      expect(title_tag(separator: ' | ')).to eq '<title>One | Two</title>'
    end

    it 'escapes HTML' do
      title '<B>'
      expect(title_tag).to eq '<title>&lt;B&gt;</title>'
    end

    it 'hides site name on request' do
      title 'Page', no_site: true
      expect(title_tag('Site')).to eq '<title>Page</title>'
    end

  end

end

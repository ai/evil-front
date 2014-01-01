# encoding: utf-8

require_relative 'spec_helper'

describe EvilFront::Russian do

  describe 'capitalize_first' do

    it 'capitalizes first letter in russian text' do
      EvilFront::Russian.capitalize_first('тест тест').should == 'Тест тест'
    end

  end

  describe 'flying_quotes' do

    it 'inserts tags and quotes with space by default' do
      EvilFront::Russian.flying_quotes('тест').should ==
        '<span class="space-before-quote"> </span>' +
        '<span class="quotes">«тест»</span>'
    end

    it 'inserts specified space' do
      EvilFront::Russian.flying_quotes('тест', space: '-').should ==
        '<span class="space-before-quote">-</span>' +
        '<span class="quotes">«тест»</span>'
    end

    it 'ignores space on request' do
      EvilFront::Russian.flying_quotes('тест', space: '').should ==
        '<span class="quotes">«тест»</span>'
    end

  end

  describe 'auto_flying_quotes' do

    it 'replaces quotes on start' do
      EvilFront::Russian.auto_flying_quotes('«тест»').should ==
        '<span class="quotes">«тест»</span>'
    end

    it 'replaces quotes in middle' do
      EvilFront::Russian.auto_flying_quotes('на «тесте».').should ==
        'на<span class="space-before-quote"> </span>' +
        '<span class="quotes">«тесте»</span>.'
    end

  end

  describe 'typograph' do

    it 'changes quotes' do
      EvilFront::Russian.typograph('сказал "смотри "зорко"".').should ==
        'сказал «смотри „зорко“».'
    end

    it 'changes dashes' do
      EvilFront::Russian.typograph('а - это б').should == 'а — это б'
    end

    it 'changes ellipsis' do
      EvilFront::Russian.typograph('а...').should == 'а…'
    end

    it 'inserts non-break spaces' do
      EvilFront::Russian.typograph('оно не надо').should == 'оно не надо'
    end

  end

  describe 'typograph_html' do

    it 'typographs plain text' do
      EvilFront::Russian.typograph_html('а - б').should == 'а — б'
    end

    it 'typographs only in text nodes' do
      EvilFront::Russian.typograph_html('<a title="а - б">а - б</a>').should ==
        '<a title="а - б">а — б</a>'
    end

    it 'ignores code tags' do
      EvilFront::Russian.typograph_html('<code>а - б</code>').should ==
        '<code>а - б</code>'
    end

    it 'inserts flying quotes' do
      EvilFront::Russian.typograph_html('<a>"ссылка"</a>').should ==
        '<a><span class="quotes">«ссылка»</span></a>'
    end

  end

end

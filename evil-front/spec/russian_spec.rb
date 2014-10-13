# encoding: utf-8

require_relative 'spec_helper'

describe EvilFront::Russian do

  describe 'capitalize_first' do

    it 'capitalizes first letter in russian text' do
      expect(EvilFront::Russian.capitalize_first('тест тест')).to eq 'Тест тест'
    end

  end

  describe 'flying_quotes' do

    it 'inserts tags and quotes with space by default' do
      expect(EvilFront::Russian.flying_quotes('тест')).to eq(
        '<span class="space-before-quote"> </span>' +
        '<span class="quotes">«тест»</span>')
    end

    it 'inserts specified space' do
      expect(EvilFront::Russian.flying_quotes('тест', space: '-')).to eq(
        '<span class="space-before-quote">-</span>' +
        '<span class="quotes">«тест»</span>')
    end

    it 'ignores space on request' do
      expect(EvilFront::Russian.flying_quotes('тест', space: '')).to eq(
        '<span class="quotes">«тест»</span>')
    end

  end

  describe 'auto_flying_quotes' do

    it 'replaces quotes on start' do
      expect(EvilFront::Russian.auto_flying_quotes('«тест»')).to eq(
        '<span class="quotes">«тест»</span>')
    end

    it 'replaces quotes in middle' do
      expect(EvilFront::Russian.auto_flying_quotes('на «тесте».')).to eq(
        'на<span class="space-before-quote"> </span>' +
        '<span class="quotes">«тесте»</span>.')
    end

    it 'works with HTML' do
      expect(EvilFront::Russian.auto_flying_quotes('<a>«ссылка»</a>')).to eq(
        '<a><span class="quotes">«ссылка»</span></a>')
    end

  end

  describe 'typograph' do
    def nbsp_mark_typograph(str)
      EvilFront::Russian.typograph(str).gsub(' ', '_')
    end

    it 'changes quotes' do
      expect(nbsp_mark_typograph('сказал "смотри "зорко"".')).to eq(
        'сказал «смотри „зорко“».')
    end

    it 'changes dashes' do
      expect(nbsp_mark_typograph('а - это б')).to eq 'а_— это_б'
    end

    it 'changes ellipsis' do
      expect(nbsp_mark_typograph('а...')).to eq 'а…'
    end

    it 'keeps new line before dash' do
      expect(nbsp_mark_typograph("- Что?\n- То!")).to eq "— Что?\n— То!"
    end

    it 'uses non-break dash on for Russian' do
      expect(nbsp_mark_typograph('web-standards.ru')).to eq 'web-standards.ru'
      expect(nbsp_mark_typograph('а-то')).to eq 'а‑то'
    end

  end

  describe 'typograph_html' do

    it 'typographs plain text' do
      expect(EvilFront::Russian.typograph_html('а...')).to eq 'а…'
    end

    it 'typographs only in text nodes' do
      expect(EvilFront::Russian.typograph_html('<a title="а...">а...</a>')).
        to eq '<a title="а...">а…</a>'
    end

    it 'ignores code tags' do
      expect(EvilFront::Russian.typograph_html('<code>а...</code>')).
        to eq '<code>а...</code>'
    end

    it 'keeps escaping' do
      expect(EvilFront::Russian.typograph_html('<b>&lt;a&gt;</b>')).
        to eq '<b>&lt;a&gt;</b>'
    end

  end

end

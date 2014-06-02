# encoding: utf-8

require_relative 'spec_helper'

describe EvilFront::English do
  def nbsp_mark_typograph(str)
    EvilFront::English.typograph(str).gsub(' ', '_')
  end

  describe 'typograph' do

    it 'changes quotes' do
      expect(nbsp_mark_typograph('"a".')).to eq '“a”.'
    end

    it 'changes dashes' do
      expect(nbsp_mark_typograph('a - b')).to eq 'a - b'
    end

    it 'changes ellipsis' do
      expect(nbsp_mark_typograph('a...')).to eq 'a…'
    end

    it 'inserts non-break spaces' do
      expect(nbsp_mark_typograph('he is a hero')).to eq 'he is_a_hero'
    end

  end

end

# encoding: utf-8

require_relative 'spec_helper'

describe EvilFront::English do
  def nbsp_mark_typograph(str)
    EvilFront::English.typograph(str).gsub(' ', '_')
  end

  describe 'typograph' do

    it 'changes quotes' do
      nbsp_mark_typograph('"a".').should == '“a”.'
    end

    it 'changes dashes' do
      nbsp_mark_typograph('a - b').should == 'a - b'
    end

    it 'changes ellipsis' do
      nbsp_mark_typograph('a...').should == 'a…'
    end

    it 'inserts non-break spaces' do
      nbsp_mark_typograph('he is a hero').should == 'he is_a_hero'
    end

  end

end

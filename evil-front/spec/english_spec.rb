# encoding: utf-8

require_relative 'spec_helper'

describe EvilFront::English do

  describe 'typograph' do

    it 'changes quotes' do
      EvilFront::English.typograph('"a".').should == '“a”.'
    end

    it 'changes dashes' do
      EvilFront::English.typograph('a - b').should == 'a - b'
    end

    it 'changes ellipsis' do
      EvilFront::English.typograph('a...').should == 'a…'
    end

    it 'inserts non-break spaces' do
      EvilFront::English.typograph('he is a hero').should == 'he is a hero'
    end

  end

end

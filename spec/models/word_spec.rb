require 'rails_helper'

RSpec.feature Word, type: :model do
  background do
    @user = create(:user)
    @wordtest1 = create(:word, user: @user)
  end

  scenario "titleが空の場合、投稿不可" do
    word = Word.new(title: '', word: 'empty_title')
    expect(word).not_to be_valid
  end

  scenario "titleが21文字以上の場合、投稿不可" do
    word = Word.new(title: 'x'*21, word: '21_letters_title')
    expect(word).not_to be_valid
  end

  scenario "wordが空の場合、投稿不可" do
    word = Word.new(title: 'empty_word', word: '')
    expect(word).not_to be_valid
  end

  scenario "wordが501文字以上の場合、投稿不可" do
    word = Word.new(title: '501_letters_word', word: 'x'*501 )
    expect(word).not_to be_valid
  end

  scenario "sourceが501文字以上の場合、投稿不可" do
    word = Word.new(title: '501_letters_source', word: '501_letters_source', source: 'x'*501 )
    expect(word).not_to be_valid
  end

  scenario "commentが10,001文字以上の場合、投稿不可" do
    word = Word.new(title: '10,001_letters', word: '10,001_letters_comment', comment: 'x'*10001 )
    expect(word).not_to be_valid
  end

  scenario "title, wordが正しく記載されている場合、投稿可能" do
    expect(@wordtest1).to be_valid
  end

  scenario "入力文字数上限以内の場合、投稿可能" do
    word = Word.new(title: 'x'*20, word: 'x'*500, source: 'x'*500, comment: 'x'*10000, user_id: @user.id )
    expect(word).to be_valid
  end


end

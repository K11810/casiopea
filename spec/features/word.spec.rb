require 'rails_helper'

RSpec.feature "タスク管理機能", type: :feature do

  background do
    @user = create(:user)
    @user2 = create(:user2)
    visit user_session_path
    fill_in "メールアドレス", with: 'testuser@example.com'
    fill_in "パスワード", with: 'password'
    # @userでログイン
    click_on 'ログインする'
    @wordtest1 = create(:word, user: @user)
    @wordtest2 = create(:second_word, user: @user2)
  end

  scenario "言葉の新規投稿テスト" do
    visit new_word_path
    fill_in 'new_word', with: 'wordtest1'
    fill_in 'new_title', with: 'titletest1'
    click_on '登録する'
    expect(page).to have_content'wordtest1'
    expect(page).to have_content'titletest1'
  end

  scenario "言葉の詳細画面への遷移テスト" do
    visit word_path(@wordtest1.id)
    expect(page).to have_content 'testtesttest_01'
  end

  scenario "words#index画面における言葉の表示順が、作成日時の降順であるかのテスト" do
    visit words_path
    expect(Word.order("updated_at desc").map(&:id)).to eq [7,6]
  end

  scenario "タイトルor言葉での検索実施可否テスト" do
    visit words_path
    fill_in 'title_or_word_search', with: '01'
    click_on '言葉で検索'
    expect(page).to have_content 'test_word_01'
    expect(page).to_not have_content 'test_word_02'
  end

  scenario "タイトルでの並び替え可否テスト" do
    visit words_path
    click_on 'タイトルで並び替え'
    @words = page.all('p.card-title')
    expect(@words[0]).to have_content 'test_word_02'
    expect(@words[1]).to have_content 'test_word_01'
  end

  scenario "言葉での並び替え可否テスト" do
    visit words_path
    click_on '言葉で並び替え'
    @words = page.all('h2.card-text')
    expect(@words[0]).to have_content 'testtesttest_02'
    expect(@words[1]).to have_content 'testtesttest_01'
  end

  scenario "投稿日での並び替え可否テスト" do
    visit words_path
    click_on '投稿日で並び替え'
    @words = Word.all.order("created_at desc")
    expect(@words[0].created_at > @words[1].created_at).to be true
  end

  scenario "言葉の編集画面への遷移・編集テスト" do
    visit edit_word_path(@wordtest1.id)
    fill_in 'source', with: 'Mr.Postman'
    fill_in 'comment', with: 'I am so tired...'
    fill_in 'tag', with: '感謝, 賞賛'
    click_on '更新する'
    expect(page).to have_content '登録されていた言葉を更新しました'
    expect(page).to have_content '感謝'
    expect(page).to have_content '賞賛'
  end

end

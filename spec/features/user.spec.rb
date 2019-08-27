require 'rails_helper'

RSpec.feature "ユーザー管理機能", type: :feature do
  background do
    @user = create(:user)
    @user2 = create(:user2)
    @wordtest1 = create(:word, user: @user)
    @wordtest2 = create(:second_word, user: @user2)
  end

  context 'ログイン・ログアウト可否テスト' do
    background do
      visit user_session_path
      fill_in "メールアドレス", with: 'testuser@example.com'
      fill_in "パスワード", with: 'password'
      click_on 'ログインする'
    end

    scenario "ログイン実施テスト" do
      expect(page).to have_content 'ログインしました'
    end

    scenario "ログアウト実施テスト" do
      click_on 'ログアウト'
      expect(page).to have_content 'ログアウトしました。'
    end
  end

  context '未ログイン状態でのアクセス制御' do
    scenario "words#indexへのアクセス不可" do
      visit words_path
      expect(page).to have_content 'アカウント登録もしくはログインしてください。'
    end

    scenario "words#newへのアクセス不可" do
      visit new_word_path
      expect(page).to have_content 'アカウント登録もしくはログインしてください。'
    end

    scenario "words#showへのアクセス不可" do
      visit word_path(@wordtest1.id)
      expect(page).to have_content 'アカウント登録もしくはログインしてください。'
    end

    scenario "words#editへのアクセス不可" do
      visit edit_word_path(@wordtest1.id)
      expect(page).to have_content 'アカウント登録もしくはログインしてください。'
    end

    scenario "users#showへのアクセス不可" do
      visit user_path(@user.id)
      expect(page).to have_content 'アカウント登録もしくはログインしてください。'
    end

    scenario "homes#topへのアクセス可能" do
      visit root_path
      expect(page).to have_content 'Welcome to CASIOPEA'
    end

    scenario "homes#aboutへのアクセス可能" do
      visit homes_about_path
      expect(page).to have_content 'CASIOPEAとは？'
    end

  end

  context 'ログイン状態でのアクセス制御' do
    background do
      # user1でログイン
      visit user_session_path
      fill_in "メールアドレス", with: 'testuser@example.com'
      fill_in "パスワード", with: 'password'
      click_on 'ログインする'
    end

    scenario "別ユーザのusers#showへのアクセス時、別ユーザーのメールアドレスが表示されない" do
      visit user_path(@user2.id)
      expect(page).to_not have_content 'メールアドレス :'
    end

    scenario "別ユーザのusers#showへのアクセス時、ユーザー情報編集ボタンが表示されない" do
      visit user_path(@user2.id)
      expect(page).to_not have_content 'ユーザー情報を編集する'
    end

    scenario "別ユーザ投稿の言葉のedit画面へのアクセス不可" do
      visit edit_word_path(@wordtest2.id)
      expect(page).to have_content '権限がありません'
    end

    scenario "新規登録画面へのアクセス不可" do
      visit new_user_session_path
      expect(page).to have_content 'すでにログインしています'
    end

    scenario "ログイン画面へのアクセス不可" do
      visit new_user_registration_path
      expect(page).to have_content 'すでにログインしています'
    end

    scenario "homes#topへのアクセス不可" do
      visit root_path
      expect(page).to have_content 'すでにログイン中です'
    end

    scenario "homes#aboutへのアクセス可能" do
      visit homes_about_path
      expect(page).to have_content 'CASIOPEAとは？'
    end

  end
end

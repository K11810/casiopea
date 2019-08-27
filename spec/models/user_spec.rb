require 'rails_helper'

RSpec.feature User, type: :model do
  background do
    create(:user)
  end

    scenario "name, email, password, password_confirmationが正しい内容で記載されていれば新規登録可能" do
      user = User.new(name: 'test', email: 'testuser@dic.com', password: 'password', password_confirmation: 'password')
      expect(user).to be_valid
    end

    scenario "nameが空の場合は新規登録不可" do
      user = User.new(name: '', email: 'testuser@dic.com', password: 'password', password_confirmation: 'password')
      expect(user).not_to be_valid
    end

    scenario "nameが51文字以上の場合は新規登録不可" do
      user = User.new(name: 'x' * 51, email: 'testuser@dic.com', password: 'password', password_confirmation: 'password')
      expect(user).not_to be_valid
    end

    scenario "emailが空の場合は新規登録不可" do
      user = User.new(name: 'testuser', email: '', password: 'password', password_confirmation: 'password')
      expect(user).not_to be_valid
    end

    scenario "emailが既に存在している場合は新規登録不可" do
      user = User.new(name: 'testuser', email: 'testuser@example.com', password: 'password', password_confirmation: 'password')
      expect(user).not_to be_valid
    end

    scenario "emailの形式が有効でない場合は新規登録不可" do
      user = User.new(name: 'testuser', email: 'testuser', password: 'password', password_confirmation: 'password')
      expect(user).not_to be_valid
    end

    scenario "emailが256文字以上の場合は新規登録不可" do
      user = User.new(name: 'name', email: "testuser@dic.com.#{'a' * 256}", password: 'password', password_confirmation: 'password')
      expect(user).not_to be_valid
    end

    scenario "passwordが未入力の場合は新規登録不可" do
      user = User.new(name: 'name', email: 'testuser@dic.com', password: '', password_confirmation: '')
      expect(user).not_to be_valid
    end

    scenario "passwordが5文字未満の場合は新規登録不可" do
      user = User.new(name: 'name', email: 'testuser@dic.com', password: 'xyz', password_confirmation: 'xyz')
      expect(user).not_to be_valid
    end

    scenario "passwordとpassword_confirmationが異なる場合は新規登録不可" do
      user = User.new(name: 'name', email: 'testuser@dic.com', password: 'password', password_confirmation: 'pass_word')
      expect(user).not_to be_valid
    end

end

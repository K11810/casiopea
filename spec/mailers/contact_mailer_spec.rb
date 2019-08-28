require "rails_helper"

RSpec.feature "word投稿時のメール機能", type: :feature do

  background do
    @user = create(:user)
    @user2 = create(:user2)
    @wordtest1 = create(:word, user: @user)
    @wordtest2 = create(:second_word, user: @user2)
  end

  feature "contact_mail機能テスト" do
    given(:mail) { ContactMailer.contact_mail(@wordtest1) }

    scenario "contact_mailテスト" do
      expect(mail.subject).to eq("新しい言葉が登録されました")
      expect(mail.to).to eq(["#{@wordtest1.user.email}"])
      expect(mail.from).to eq(["CASIOPEA@example.com"])
    end
  end

end

require "rails_helper"

RSpec.feature "リマインドメール機能", type: :feature do

  background do
    # リマインドメールの準備として、notification.rake内のタスクに類似した処理を実行。
    @user = create(:user)
    @wordtest1 = create(:word, user: @user)
    @wordtest2 = create(:second_word, user: @user)
    @words = Word.where(user_id: @user.id, created_at: Time.zone.now.all_day)
  end

  feature "notification_mail機能テスト" do
    # リマインドメールが送信されていることの確認
    given(:mail) { NotificationMailer.notification(@user, @words) }

    scenario "notification_mailテスト" do
      expect(mail.subject).to have_content("投稿の言葉一覧")
      expect(mail.to).to eq(["#{@wordtest1.user.email}"])
      expect(mail.from).to eq(["CASIOPEA@example.com"])
    end
  end
end

namespace :notification do

  desc '開発環境メールテスト'
  task mail_test_in_dev: :environment do
    @user = User.find_by(id:1)
    @words = Word.where(user_id: @user.id, created_at: Time.zone.now.all_day)
      NotificationMailer.notification(@user, @words).deliver
  end

  desc '開発環境メールテスト'
  task mail_test_in_dev2: :environment do
    @user = User.find_by(id:1)
    @words = Word.where(user_id: @user.id, created_at: 2.day.ago.all_day)
      NotificationMailer.notification(@user, @words).deliver
  end

  # desc 'ユーザーへのメール通知'
  # task notification: :environment do
  #   users = User.all
  #   users.each do |user|
  #     NotificationMailer.notification(user).deliver
  #   end
  # end
end

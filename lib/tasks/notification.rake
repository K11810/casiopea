namespace :notification do
  desc 'ユーザーへのメール通知'
  task notification: :environment do
    users = User.all

     users.each do |user|
      NotificationMailer.notification(user).deliver
    end
  end
end

class NotificationMailer < ApplicationMailer

  def notification(user, words)
    @user = user
    @words = words
    @day = @words.first.created_at.strftime("%Y年%m月%d日")

    mail to: "#{@user.email}", subject: "#{@day}投稿の言葉一覧"
  end

end

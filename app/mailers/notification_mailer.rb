class NotificationMailer < ApplicationMailer

  def notification(user, words)
    @user = user
    @words = words
     mail to: "#{@user.email}", subject: "Hello, #{@user.name}"
  end

end

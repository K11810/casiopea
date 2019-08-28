class ContactMailer < ApplicationMailer

  def contact_mail(contact)
    @word = contact
    mail to: @word.user.email, subject: "新しい言葉が登録されました"
  end

end

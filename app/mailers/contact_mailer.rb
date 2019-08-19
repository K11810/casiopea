class ContactMailer < ApplicationMailer

  def contact_mail(contact)
    @word = contact
    mail to: @word.user.email, subject: "(仮)お問い合わせの確認メール"
  end

end

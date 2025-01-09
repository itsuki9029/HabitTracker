class ContactMailer < ApplicationMailer
  default from: 'noreply@example.com'

  def contact_email(name, user_email, message)
    @name = name
    @message = message
    @recipient = user_email
    mail(to: 'itsuki3658@gmail.com', reply_to: user_email, subject: 'お問い合わせ内容')
  end
end

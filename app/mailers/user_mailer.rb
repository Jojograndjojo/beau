class UserMailer < ApplicationMailer
  default from: 'notifications@beau.com'

  def invitation_email(name,email)
    @url = 'http://beau.com'
    @name = name
    mail(to: email, subject: 'Admin invitation')
  end
end

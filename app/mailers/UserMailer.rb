
class UserMailer < ApplicationMailer
  default from: 'bakawale51@gmail.com'
 
  def welcome_email(user)
    @url  = 'http://example.com/login'
    mail(to: 'rahul@kliftox.com', subject: 'Massege by 	sendgrid.net')
  end
end
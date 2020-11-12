
class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'
 
  def welcome_email
    @url  = 'http://example.com/login'
    mail(to: 'testyze@mailinator.com', subject: 'Welcome to My Awesome Site')
  end
end
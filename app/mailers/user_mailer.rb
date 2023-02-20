class UserMailer < ApplicationMailer
  default from: 'no-reply@maltaevents.fr'   
  def welcome_email(user)               
    @user = user                                                     
    @url  = 'https://maltaevents.herokuapp.com/'                                 
    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end
end
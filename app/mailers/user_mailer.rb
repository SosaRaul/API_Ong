class UserMailer < ApplicationMailer
    
    default from: 'mdeveloper3232@gmail.com'

  def welcome_email
    @user = params[:user]
    @url  = 'http://example.com/login'
    mail(to: @user.email, 
         subject: 'Bienvenido a nuestro sitio ONGgrupo73!',
         template_path: 'user_mailer',   #app/views/user_mailer
         template_name: 'welcome_email')
  end

  def contact_email(email)
    mail(to: email,
         subject: 'Gracias por contactarnos'
         template_path: 'user_mailer',
         template_name: 'contact_email')
  end
end

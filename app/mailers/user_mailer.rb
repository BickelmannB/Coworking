class UserMailer < ApplicationMailer
  default from: "bricecoworking@gmail.com"

  def registration_confirmation(request)
    @request = request
    mail(to: "#{request.name} <#{request.email}", subject: 'Registration Confirmation for Coworking')
  end

  def three_month_mail(request)
    @request = request
    mail(to: "#{request.name} <#{request.email}", subject: 'Waiting Confirmation for Coworking')
  end
end

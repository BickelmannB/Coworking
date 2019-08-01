class UserMailer < ApplicationMailer
  default from: "<bricecoworking@gmail.com>"

  def registration_confirmation(request)
    @request = request
    mail(to: "#{request.name} <#{request.email}>", subject: 'Registration Confirmation for Coworking')
  end

  def three_month_mail(request)
    @request = request
    mail(to: "#{request.name} <#{request.email}>", subject: 'Waiting Confirmation for Coworking')
  end

  def contract_acceptance(request)
    @request = request
    mail(to: "#{request.name} <#{request.email}>", subject: 'Contract for Coworking')
  end

  def one_month_contract(request)
    @request = request
    mail(to: "#{request.name} <#{request.email}>", subject: 'Contract Renewal')
  end

  def profil_user_mail(user)
    @user = user
    mail(to: " Username <#{user.email}>", subject: 'Login informations')
  end
end

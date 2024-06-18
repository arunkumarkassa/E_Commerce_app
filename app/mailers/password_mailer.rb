class PasswordMailer < ApplicationMailer
  def send_otp(email)
    @otp = email[:otp]
    mail(to: email[:email], subject: 'Your OTP is:')
  end
end

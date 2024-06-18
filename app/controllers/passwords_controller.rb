class PasswordsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:forgot, :reset, :update_password]
  def forgot
    customer = Customer.find_by(email: params[:email])

    if customer
      otp = generate_otp
      if send_otp_and_verify(customer, otp)
        render json: { message: 'OTP sent successfully' }, status: :ok
      else
        render json: { error: 'Failed to send OTP' }, status: :internal_server_error
      end
    else
      render json: { error: 'Customer not found' }, status: :not_found
    end
  end

  def reset
    customer = Customer.find_by(email: params[:email])
    otp_record = Otp.find_by(customer_id: customer.id, otps: params[:otps])

    if customer && otp_record && otp_record.valid_until >= Time.now
      render json: { message: 'OTP verified successfully' }, status: :ok
    else
      render json: { error: 'Invalid OTP or OTP expired' }, status: :unprocessable_entity
    end
  end

  def update_password
    customer = Customer.find_by(email: params[:email])

    if customer && params[:password] == params[:confirm_password]
      customer.update(password: params[:password])
      render json: { message: 'Password updated successfully' }, status: :ok
    else
      render json: { error: 'Passwords do not match' }, status: :unprocessable_entity
    end
  end

  private

  def generate_otp
    rand(100000...999999).to_s
  end

  def send_otp_and_verify(customer, otp)
    otp_record = Otp.create(otps: otp, customer_id: customer.id, valid_until: Time.now + 5.minutes)
    if otp_record.valid?
      PasswordMailer.send_otp(email: customer.email, otp: otp).deliver_now
      return true
    else
      return false
    end
  end
end

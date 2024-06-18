class AuthenticationsController < ApplicationController
  before_action :authorize_request, except: :create

  def create
    customer = Customer.find_by(email: login_params[:email])
    if customer && customer.authenticate(login_params[:password])
      token = encode_token(customer_id: customer.id)
      time = Time.now + 24.hours.to_i
      render json: {
        token: token,
        exp: time.strftime("%m-%d-%Y %H:%M"),
        # username: customer.username,
        customer: {
          full_name: customer.full_name,
          email: customer.email,
          country_code: customer.country_code,
          mobile_number: customer.mobile_number
        }
      }, status: :ok
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  private

  def login_params
    params.permit(:email, :password)
  end

  def encode_token(payload)
    JWT.encode(payload, Rails.application.secret_key_base)
  end
end

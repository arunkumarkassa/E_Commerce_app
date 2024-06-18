class CustomersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]
  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      render json: { message: 'Customer created successfully' }, status: :created
    else
      render json: { error: @customer.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:full_name, :country_code, :mobile_number, :email, :password, :terms_and_conditions)
  end
end

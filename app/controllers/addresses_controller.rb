class AddressesController < ApplicationController
  before_action :authorize_request
  before_action :set_user

  def index
    addresses = Address.all
    render json: addresses
  end

  def create
    address = @customer.addresses.new(address_params)
    if address.save
      render json: address, status: :created
    else
      render json: address.errors, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @customer = @current_customer
  end

  def address_params
    params.require(:address).permit(:house_number, :street, :landmark, :area, :city, :district, :pin_code, :state, :country, :address_type)
  end

end

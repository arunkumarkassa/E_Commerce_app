class FavoritesController < ApplicationController
  before_action :authorize_request
  before_action :set_customer, only: [:index]
  before_action :set_favorite, only: [:destroy]

  def create
    @favorite = Favorite.new(favorite_params)
    if @favorite.save
      render json: { message: 'Favorite added', data: @favorite }, status: :ok
    else
      render json: { message: 'Favorite not saved', data: @favorite.errors }, status: :unprocessable_entity
    end
  end

  def index
    @favorites = Favorite.all
    render json: @favorites, each_serializer: FavoriteSerializer
    # favorites = @customer.favorites.includes(:product)
    # render json: { message: 'Loaded favorites', data: favorites }, status: :ok
  end

  def destroy
    if @favorite.destroy
      render json: { message: 'Favorite removed', data: @favorite }, status: :ok
    else
      render json: { message: 'Favorite not removed', data: @favorite.errors }, status: :unprocessable_entity
    end
  end

  private

  def favorite_params
    params.require(:favorite).permit(:customer_id, :product_id)
  end

  def set_customer
    @customer = @current_customer
    # unless @customer
    #   render json: { message: 'Customer not found' }, status: :not_found
  end

  def set_favorite
    @favorite = Favorite.find_by(id: params[:id])
  end
end

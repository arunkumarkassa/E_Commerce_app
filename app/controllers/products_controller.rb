class ProductsController < ApplicationController
  before_action :authorize_request
  before_action :set_product, only: [:update, :destroy]
  def index
    @products = Product.all
    render json: @products, each_serializer: ProductSerializer
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      render json: @product, status: :created, serializer: ProductSerializer
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def update
    authenticate_user!
    if @product.update(product_params)
      render json: @product, serializer: ProductSerializer
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    head :no_content
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :price, :image, :size, :colour)
  end
end

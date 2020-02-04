class ProductController < ApplicationController


  before_action :require_sign_in, only: [:new]
  before_action :current_user, only: [:new]


  def index
    @products = Product.order('id ASC')
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to product_index_path
    else
      render action: :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end





  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :image, :language, :comment)
  end


end

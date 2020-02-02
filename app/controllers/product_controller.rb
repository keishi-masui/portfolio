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

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def require_sign_in
    redirect_to sessions_login_path unless current_user
  end


end

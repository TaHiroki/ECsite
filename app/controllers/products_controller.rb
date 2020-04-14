class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find_by(id: params[:id])
  end

  def check
    @product = Product.find_by(id: params[:id])
    @order = Order.new
  end
end

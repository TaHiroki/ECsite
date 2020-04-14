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
    if @price = Price.find_by(id: 1)
      @price = Price.find_by(id: 1)
    else
      @price = Price.new
      @price.count = 1
      @price.price = 0
    end

    @order.count = 1
    @order.user_id = 1
    @order.product_id = @product.id

    @price.price += @product.money

    @order.save
    @price.save

    @orders = Order.where(count: 1)
  end
  
end

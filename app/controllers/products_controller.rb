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
    if @price = Price.find_by(count: @current_user.count)
      @price = Price.find_by(count: @current_user.count)
    else
      @price = Price.new
      @price.count = @current_user.count
      @price.price = 0
    end

    @order.count = @current_user.count
    @order.user_id = @current_user.id
    @order.product_id = @product.id

    @price.price += @product.money

    @order.save
    @price.save

    @orders = Order.where(count: @current_user.count)
  end

  def confirm
    @price = Price.find_by(count: @current_user.count)
    @orders = Order.where(count: @current_user.count)
    render("products/check")
  end

  def order
    @price = Price.find_by(count: @current_user.count)
    @orders = Order.where(count: @current_user.count)
    @count = @current_user.count
    @current_user.count += 1
    @current_user.save
  end

  def ordersum
    @prices = Price.where(user_id: @current_user.id).order(count: :asc)
  end

  def ordershow
    @price = Price.find_by(id: params[:id])
    @orders = Order.where(count: @price.count, user_id: @current_user.id)
  end

end

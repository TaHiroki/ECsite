class ProductsController < ApplicationController

  before_action :need_login

  def index
    @products = Product.all.order(created_at::asc)
    if @current_user.admin_id == 1
      @header_color = "admin"
      @header_menu_color = "header-menus_admin"
    end
  end

  def show
    @product = Product.find_by(id: params[:id])
    if @current_user.admin_id == 1
      @header_color = "admin"
      @header_menu_color = "header-menus_admin"
    end
  end

  def check
    @product = Product.find_by(id: params[:id])
    @order = Order.new
    if @price = Price.find_by(count: @current_user.count, user_id: @current_user.id)
      @price = Price.find_by(count: @current_user.count, user_id: @current_user.id)
    else
      @price = Price.new
      @price.count = @current_user.count
      @price.price = 0
      @price.user_id = @current_user.id
    end

    @order.count = @current_user.count
    @order.user_id = @current_user.id
    @order.product_id = @product.id

    @price.price += @product.money

    @order.save
    @price.save

    @orders = Order.where(count: @current_user.count, user_id: @current_user.id)
  end

  def confirm
    @price = Price.find_by(count: @current_user.count, user_id: @current_user.id)
    @orders = Order.where(count: @current_user.count, user_id: @current_user.id)
    render("products/check")
  end

  def order
    @price = Price.find_by(count: @current_user.count, user_id: @current_user.id)
    @orders = Order.where(count: @current_user.count, user_id: @current_user.id)
    @count = @current_user.count
    @current_user.count += 1

    begin
      @current_user.save!
    rescue => @e
      @count = 9999
    end
  end

  def ordersum
    @prices = Price.where(user_id: @current_user.id).order(count: :asc)
  end

  def ordershow
    @price = Price.find_by(id: params[:id])
    @orders = Order.where(count: @price.count, user_id: @current_user.id)
  end

  def destroy
    @order = Order.find_by(id: params[:id])
    @price = Price.find_by(user_id: @current_user.id, count: @order.count)
    @price.price -= @order.product.money
    @order.destroy
    @price.save
    flash[:notice] = "カートから削除しました"
    redirect_to("/products/confirm")
  end
end

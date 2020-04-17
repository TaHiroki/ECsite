class MastersController < ApplicationController
  before_action :header_color_admin

  def header_color_admin
    @header_color = "admin"
    @header_menu_color = "header-menus_admin"
  end

  def index
    @user = User.find_by(id: session[:user_id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.password = params[:password]
    if @user.save
      flash[:notice] = "編集しました"
      render("masters/index")
    else
      render("masters/edit")
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(name: params[:name],
                          money: params[:money],
                          description: params[:description],
                          ) 
    @product.product_img = "#{@product.id}.png"
    image = params[:product_img]
    File.binwrite("public/image/#{@product.product_img}", image.read)
    if @product.save
      flash[:notice] = "商品を登録しました"
      redirect_to("/products/index")
    else
      render("masters/new")
    end
  end

end

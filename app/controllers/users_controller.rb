class UsersController < ApplicationController

  before_action :need_login, {only:[:index, :logout, :edit, :update, :destroy]}
  before_action :forbid_login, {only:[:login, :mypage, :new, :create]}


  def login
  end

  def mypage
    @user = User.find_by(email: params[:email])
    if @user && @user.delete_id == 0 && @user.admin_id == 0 && @user.authenticate(params[:password])
      flash[:notice] = "ログインしました"
      session[:user_id] = @user.id
      redirect_to("/users/index")
    elsif @user && @user.delete_id == 0 && @user.admin_id == 1 && @user.authenticate(params[:password])
      flash[:notice] = "管理者でログインしました"
      session[:user_id] = @user.id
      redirect_to("/masters/index")
    elsif @user && @user.delete_id == 1 && @user.authenticate(params[:password])
      flash[:notice] = "削除されたアカウントです"
      render("users/login")
    else
      @error_message = "emailかパスワードが間違っています"
      render("users/login")
    end
  end

  def logout
    flash[:notice] = "ログアウトしました"
    session[:user_id] = nil
    redirect_to("/login")
  end

  def index
    @user = User.find_by(id: session[:user_id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(name: params[:name],
                    email: params[:email],
                    password: params[:password],
                    delete_id: 0,
                    admin_id: 0,
                    count: 1)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "新規作成しました"
      redirect_to("/users/index")
    else
      render("users/new")
    end
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
      render("users/index")
    else
      render("users/edit")
    end
  end

  def destroy
    @current_user.delete_id = 1
    @current_user.save
    session[:user_id] = nil
    flash[:notice] = "アカウントを削除しました"
    render("users/login")
  end

end

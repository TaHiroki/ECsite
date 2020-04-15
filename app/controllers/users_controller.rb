class UsersController < ApplicationController


  def login
  end

  def mypage
    @user = User.find_by(email: params[:email],
                        password: params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to("/users/index")
    else
      render("users/login")
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to("/login")
  end

  def index
    @user = User.find_by(id: session[:user_id])
  end

  def new
  end

  def create
    @user = User.new(name: params[:name],
                    email: params[:email],
                    password: params[:password],
                    delete_id: 0,
                    admin_id: 0,
                    count: 1)
    @user.save
    render("users/index")
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.password = params[:password]
    @user.save
    render("users/index")
  end

end

class UsersController < ApplicationController


  def login
  end

  def index
    @user = User.find_by(id: 1)
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

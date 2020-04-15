class UsersController < ApplicationController

  def index
    @user = User.find_by(id: 1)
  end

  def new
  end

  def create
    @user = User.new(name:params[:name],
                    email:params[:email],
                    password:params[:password],
                    delete_id:0,
                    admin_id:0,
                    count:1)
    @user.save
    render("users/index")
  end

end

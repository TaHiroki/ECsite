class MastersController < ApplicationController
  before_action :header_color_admin

  def header_color_admin
    @header_color = "admin"
    @header_menu_color = "header-menus_admin"
  end

  def index
    @user = User.find_by(id: session[:user_id])
  end

end

class ApplicationController < ActionController::Base
    before_action :set_current_user
    before_action :header_color


    def set_current_user
        @current_user = User.find_by(id: session[:user_id])
    end

    def header_color
        @header_color = "user_user"
        @header_menu_color = "header-menus"
    end
end

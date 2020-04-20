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

    def need_login
        if @current_user == nil
            flash[:notice] = "ログインが必要です"
            redirect_to("/login")
        end
    end

    def forbid_login
        if @current_user
            flash[:notice] = "すでにログインしています"
            redirect_to("/users/indec")
        end
    end

end

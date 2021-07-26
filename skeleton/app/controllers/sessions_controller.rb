class SessionsController < ApplicationController
    before_action :redirect, only:[:new, :create]
    
    def new
        @user = User.new
        render :new
    end

    def create
        login_user!
        redirect_to user_url(@user)
    end

    def destroy
        logout!
        redirect_to new_session_url
    end

    def redirect
        if logged_in?
            redirect_to cats_url
        end
    end

end
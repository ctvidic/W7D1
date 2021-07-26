class SessionsController < ApplicationController
    before_action :redirect, except:[:new, :create]
    
    def new
        @user = User.new
        render :new
    end

    def create
        login_user! 
    end

    def destroy
        if @current_user
            @current_user.reset_session_token!
        end
        session[:session_token] = nil
        redirect_to new_session_url
    end



end
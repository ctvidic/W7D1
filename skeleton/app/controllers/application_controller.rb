class ApplicationController < ActionController::Base
    
    helper_method :current_user, :logged_in?

    def current_user
        debugger
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def logged_in?
        debugger
        !!@current_user
    end

    def redirect
        if logged_in?
            redirect_to cats_url
        end
    end

    def login_user!
        @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        if @user
            session[:session_token] = @user.reset_session_token!
            # current_user
            # debugger
        else
            render :new
        end
    end
end

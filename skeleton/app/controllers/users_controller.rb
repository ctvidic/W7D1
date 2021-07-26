class UsersController < ApplicationController
    before_action :redirect, except:[:new, :create]

    def index
        @users = User.all
        render :index
    end

    def show
        @user = User.find_by(id: params[:id])
        render :show
    end

    def new
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            login_user!
            redirect_to cats_url
        else
            render json: @user.errors.full_messages, status: 422
        end
    end

    def user_params
        params.require(:user).permit(:username, :password)
    end

    def redirect
        if logged_in?
            redirect_to cats_url
        end
    end

    def destroy
        @user = User.find_by(id: params[:id])
        @user.destroy
        redirect_to cats_url
    end

end
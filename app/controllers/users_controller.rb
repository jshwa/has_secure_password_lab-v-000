class UsersController < ApplicationController

  def index
    if session[:user_id]
      render 'index'
    else
      redirect_to 'user/new'
    end
  end

  def new
    @user = User.new
  end

  def create
    if user_params[:password] != user_params[:password_confirmation]
      redirect_to 'users/new'
    else
      @user = User.create(user_params)
      session[:user_id] = @user.id
      redirect_to 'users/index'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end

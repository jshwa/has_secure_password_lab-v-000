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
    user = User.new(user_params).save
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end

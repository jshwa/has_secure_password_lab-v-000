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
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to 'users/index'
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end

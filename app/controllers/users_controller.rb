class UsersController < ApplicationController

  def index
    if logged_in

    else
      redirect_to '/users/new'
  end

  def new
    @user = User.new
  end

  def create
    if @user = User.find_by(username: user_params[:username])
      return head(:forbidden) unless @user.authenticate(user_params[:password])
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end

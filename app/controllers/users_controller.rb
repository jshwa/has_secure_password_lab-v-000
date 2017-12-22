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

  end
end

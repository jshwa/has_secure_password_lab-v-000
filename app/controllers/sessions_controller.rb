class SessionsController < ApplicationController
  def create
    @user = User.find_by(name: params[:name])
    raise @user.inspect
    return head(:forbidden) unless @user.authenticate(params[:password])
    session[:user_id] = @user.id
  end
end

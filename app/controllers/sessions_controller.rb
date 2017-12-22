class SessionsController < ApplicationController
  def create
    @user = User.find_by(name: params[:name])
    raise params[:name].inspect
    return head(:forbidden) unless @user.authenticate(params[:password])
    session[:user_id] = @user.id
  end
end

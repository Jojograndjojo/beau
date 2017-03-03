class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.where(username: params[:username]).first
    if user && user.authenticate(params[:password]) 
      session[:user_id] = user.id
      redirect_to admins_path
    else
      redirect_to login_admins_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_admins_path
  end

end

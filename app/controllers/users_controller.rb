class UsersController < ApplicationController

  def new
  end

  def add_user
  end

  def send_invitation
    name = params[:name]
    email = params[:email]
    UserMailer::invitation_email(name,email).deliver
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/admins'
    else
      redirect_to '/users/new'
    end
  end

  def delete
    user = User.where(username: params[:username])
    user.destroy
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end

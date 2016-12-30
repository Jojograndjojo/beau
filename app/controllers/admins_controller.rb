class AdminsController < ApplicationController

  def show
    @artpiece = Artpiece.new
    @drawings = Artpiece.where(type_of_art: 'Drawing')
    @paintings = Artpiece.where(type_of_art: 'Painting')
    @printmakings = Artpiece.where(type_of_art: 'Printmaking')
    @artTypes = [@drawings,@paintings,@printmakings]
  end

  def create
    @user = User.new(params[:user])
    @user.password = params[:password]
    @user.save!
  end

  def login
    @user = User.find_by_email(params[:email])
    if @user.password == params[:password]
      give_token
    else
      redirect_to home_url
    end
  end
end

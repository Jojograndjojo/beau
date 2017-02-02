class AdminsController < ApplicationController

  before_action :authorize

  def show
    @artpiece = Artpiece.new
    @drawings = Artpiece.where(type_of_art: 'Drawing')
    @paintings = Artpiece.where(type_of_art: 'Painting')
    @printmakings = Artpiece.where(type_of_art: 'Printmaking')
    @artTypes = [@drawings,@paintings,@printmakings]
  end

  def management
    @users = User.all
  end

  def send_invitation
    name = params[:name]
    email = params[:email]
    UserMailer::invitation_email(name,email).deliver
  end
end

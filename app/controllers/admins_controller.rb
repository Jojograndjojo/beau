class AdminsController < ApplicationController

  before_action :authorize
  before_action :set_about, only: [:show]
  before_action :set_artTypes, only: [:show]

  def show
    @artpiece = Artpiece.new
  end

  def management
    @users = User.all
  end

  def send_invitation
    name = params[:name]
    email = params[:email]
    UserMailer::invitation_email(name,email).deliver
  end

  private

  def set_about
    @abouts = About.all
    if @abouts.size > 0
      @about = About.all.last
    else
      @about = About.new
    end
  end

  def set_artTypes
    @artTypes = []
    @artTitles = []

    Artpiece.all.each do |artpiece|
      unless @artTitles.include?(artpiece.type_of_art)
        @artTitles << artpiece.type_of_art
      end
      @artTitles.sort!
    end

    @artTitles.each do |artTitle|
      @artTypes << Artpiece.where(type_of_art: artTitle).order(:order)
    end

  end

end

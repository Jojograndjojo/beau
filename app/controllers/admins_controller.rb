class AdminsController < ApplicationController

  before_action :authorize
  before_action :set_about, only: [:show]

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

  private

  def set_about
    @abouts = About.all
    if @abouts.size > 0
      @about = About.all.last
    else
      @about = About.new
    end
  end

end

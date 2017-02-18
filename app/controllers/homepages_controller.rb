class HomepagesController < ApplicationController

  def index
    @homepage_picture = Artpiece.where(homepage_picture: true).first
    @drawings = Artpiece.where(type_of_art: 'Drawing')
    @paintings = Artpiece.where(type_of_art: 'Painting')
    @printmakings = Artpiece.where(type_of_art: 'Printmaking')
    @artTypes = [@drawings,@paintings,@printmakings]
  end

end

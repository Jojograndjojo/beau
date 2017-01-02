class HomepagesController < ApplicationController

  def index
    @homepage_picture = Artpiece.all.shuffle.first
  end


end

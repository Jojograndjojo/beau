class ArtpiecesController < ApplicationController

  def create
    @artpiece = Artpiece.new(artpiece_params)
    @artpiece.save!
    redirect_to admins_path
  end

  def destroy
    Artpiece.find(params[:id]).destroy
    redirect_to admins_path
  end

  def edit
    @artpiece = Artpiece.find(params[:id])
  end

  def update
    @artpiece = Artpiece.find(params[:artpiece][:id])
    @artpiece.update(artpiece_params)
    redirect_to admins_path
  end

  def drawings
    @drawings = Artpiece.where(type_of_art: 'Drawing')
  end

  def paintings
    @paintings = Artpiece.where(type_of_art: 'Painting')
  end

  def printmakings
    @printmakings = Artpiece.where(type_of_art: 'Printmaking')
  end

  def update_homepage_picture
    Artpiece.all.update_all(homepage_picture: false)
    @artpiece = Artpiece.find(params[:id])
    @artpiece.update_columns(homepage_picture: true)
    redirect_to admins_path
  end

  private

  def artpiece_params
    params.require(:artpiece).permit(:image, :title, :type_of_art, :year)
  end
end

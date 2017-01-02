class ArtpiecesController < ApplicationController

  def create
    @artpiece = Artpiece.new(artpiece_params)
    @artpiece.save
    redirect_to admins_path
  end

  def destroy
    @artpiece = Artpiece.find(params[:id]).destroy
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

  private

  def artpiece_params
    params.require(:artpiece).permit(:image, :title, :type_of_art)
  end
end

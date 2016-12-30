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

  private

  def artpiece_params
    params.require(:artpiece).permit(:image, :title, :type_of_art)
  end
end

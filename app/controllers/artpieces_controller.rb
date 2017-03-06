class ArtpiecesController < ApplicationController

  def create
    @artpiece = Artpiece.new(artpiece_params)
    set_order(@artpiece)
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

  def move_up
    @artpiece = Artpiece.find(params[:id])
    current_order = @artpiece.order

    if @artpiece.order > 1
      Artpiece.where(type_of_art: @artpiece.type_of_art, order: (current_order - 1)).first.update_columns(order: current_order)
      @artpiece.update_columns(order:(current_order - 1))
    end
    redirect_to admins_path
  end

  def move_down
    @artpiece = Artpiece.find(params[:id])
    current_order = @artpiece.order

    unless Artpiece.where(type_of_art: @artpiece.type_of_art, order: current_order + 1).empty?
      Artpiece.where(type_of_art: @artpiece.type_of_art, order: current_order + 1).first.update_columns(order: current_order)
      @artpiece.update_columns(order: (current_order + 1))
    end
    redirect_to admins_path
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

  def set_order(artpiece)
    if Artpiece.where(type_of_art: artpiece.type_of_art).empty?
      artpiece.order = 1
    else
      artpiece.order = Artpiece.where(type_of_art: artpiece.type_of_art).last.order + 1
    end
  end

end

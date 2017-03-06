class HomepagesController < ApplicationController
  before_action :set_artTypes

  def index
    @homepage_picture = Artpiece.where(homepage_picture: true).first
    @drawings = Artpiece.where(type_of_art: 'Drawing')
    @paintings = Artpiece.where(type_of_art: 'Painting')
    @printmakings = Artpiece.where(type_of_art: 'Printmaking')
  end

  private

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

class AboutsController < ApplicationController
  before_action :set_about, only: [:show, :update, :destroy]

  def index
    @about = About.all.last
  end

  def show
  end

  def edit
    @about = About.all.last
  end

  def create
    @about = About.new(about_params)

    respond_to do |format|
      if @about.save
        format.html { redirect_to '/admins', notice: 'About was successfully created.' }
        format.json { render :show, status: :created, location: @about }
      else
        format.html { render :new }
        format.json { render json: @about.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @about = About.all.last
    @about.update(about_params)
  end


  def destroy
    @about.destroy
    respond_to do |format|
      format.html { redirect_to abouts_url, notice: 'About was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def display
    About.all.update_all(displayed: false)
    @about.update_columns(displayed: true)
    redirect_to admins_path
  end

  private

    def set_about
      @about = About.all.last
    end

    def about_params
      params.require(:about).permit(:content)
    end
end

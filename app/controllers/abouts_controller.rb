class AboutsController < ApplicationController
  before_action :set_about, only: [:show, :edit, :update, :destroy]

  def index
    @about = About.all.last
  end

  def show
  end

  def edit
  end

  def create
    @about = About.new(about_params)

    respond_to do |format|
      if @about.save
        format.html { redirect_to @about, notice: 'About was successfully created.' }
        format.json { render :show, status: :created, location: @about }
      else
        format.html { render :new }
        format.json { render json: @about.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @about.update(about_params)
        format.html { redirect_to @about, notice: 'About was successfully updated.' }
        format.json { render :show, status: :ok, location: @about }
      else
        format.html { render :edit }
        format.json { render json: @about.errors, status: :unprocessable_entity }
      end
    end
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
      @about = About.find(params[:id])
    end

    def about_params
      params.require(:about).permit(:content)
    end
end

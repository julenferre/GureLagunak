class ImagesController < ApplicationController
	
  def index
    @images = Image.order('created_at')
  end

  def new
  	@img = Image.new
  end

  def show
  	@img = Image.find(params[:id])
  end

  def create
  	@img = Image.new(image_params)
  	@img.user = current_user
    if @img.save 
      flash.now[:success] = "Irudia ondo igo da!"
      redirect_to root_path
      # render html: "BAI :D"
    else
      render 'new'
      # render html: "Ez :("
    end 
  end

  private
  def image_params
    params.require(:image).permit(:title, :img)
  end

end

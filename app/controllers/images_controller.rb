class ImagesController < ApplicationController
	
  def index
    @images = Image.order('created_at desc')
    
  end

  def new
  	@img = Image.new
  end

  def show
  	@img = Image.find(params[:id])
    @comm = Comment.new
    @comments = Comment.where(image: @img).order('created_at desc')
    @voteimg = VoteImg.new
    @total = VoteImgsController.
  end

  def create
  	@img = Image.new(image_params)
  	@img.user = current_user
    if @img.save 
      flash.now[:success] = "Irudia ondo igo da!"
      redirect_to current_user
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

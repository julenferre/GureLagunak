class ImagesController < ApplicationController
	
  def index
    @images = Image.order('created_at desc')
  end

  def new
  	@img = Image.new
  end

  def show
  	@img = Image.find(params[:id])
    @comm = CommentsController.getnew
    @comments = CommentsController.getcomments(@img)
    @voteimg = VoteImgsController.getnew
    @votecomm = VoteCommsController.getnew
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

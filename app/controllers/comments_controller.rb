class CommentsController < ApplicationController

	def new
		@comm = Comment.new
	end

	def index
		@comm = Comment.find(image: Image.find(params[:id]))
	end

	def create
		@comm = Comment.new(comm_params)
		@comm.user = current_user
		@comm.image = Image.find(params[:id])
		if @comm.save 
	      flash[:success] = "Iruzkina ondo igo da!"
	      redirect_to image_path
	      # render html: "BAI :D"
	    else
	      render 'new'
	      # render html: "Ez :("
	    end
	end

	private
	def comm_params
	  params.require(:comment).permit(:text)
	end

end

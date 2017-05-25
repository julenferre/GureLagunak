class CommentsController < ApplicationController

	def new
		@comm = Comment.new
	end

	def index
		
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

	def self.getnew
		Comment.new
	end

	def self.getcomments(image)
		Comment.where(image: image).order('created_at desc')
	end

	private
	def comm_params
	  params.require(:comment).permit(:text)
	end

end

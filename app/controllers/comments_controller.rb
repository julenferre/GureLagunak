class CommentsController < ApplicationController

	def new
		Comment.new
	end

	def index
		
	end

	def create
		@comment = Comment.new(comm_params)
		@comment.user = current_user
		@comment.image = Image.find(params[:id])
		if @comment.save 
	      flash[:success] = "Iruzkina ondo igo da!"
	      redirect_to image_path
	      # render html: "BAI :D"
	    else
	      render 'new'
	      # render html: "Ez :("
	    end
	end

	def destroy
		@image_id = Comment.find(params[:id]).image.id.to_s
    	Comment.find(params[:id]).delete
    	flash[:success] = "Iruzkina ondo ezabatu da."
    	redirect_to '/images/'+@image_id   	
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

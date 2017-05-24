class VoteImgsController < ApplicationController

	def new
		@voteimg = VoteImg.new
	end

	def show
		@total = VoteImg.where(positive: 1, image: Image.find(params[:id])).count - VoteImg.where(positive: 0).count
	end

	def self.kaka(total)
		
	end

	def create
		@voteimg = VoteImg.new(voteimg_params)
		@voteimg.user = current_user
		@voteimg.image = Image.find(params[:id])
		if @voteimg.save 
			flash[:success] = "Bozketa ondo egin da!"
			redirect_to image_path
	        # render html: "BAI :D"
		else
		  	render 'new'
		    # render html: "Ez :("
		end
	end

	private
	def voteimg_params
	  params.require(:vote_img).permit(:positive)
	end

end

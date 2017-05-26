class VoteImgsController < ApplicationController

	def new
		@voteimg = VoteImg.new
	end

	def index
		
	end

	def create
		@voteimg = VoteImg.new(voteimg_params)

		if VoteImg.where(user: current_user, image: Image.find(params[:id])).count > 0
			VoteImg.where(user: current_user, image: Image.find(params[:id])).destroy_all
		end

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

    def self.getnew
      VoteImg.new
    end

	def self.gettotal(id)
		VoteImg.where(positive: 1, image: Image.find(id)).count - VoteImg.where(positive: 0, image: Image.find(id)).count
	end

	private
	def voteimg_params
	  params.require(:vote_img).permit(:positive)
	end

end

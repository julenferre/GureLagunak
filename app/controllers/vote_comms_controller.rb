class VoteCommsController < ApplicationController

	def new
		@votecomm = VoteComm.new(comment_id: id)
	end

	def index
		
	end

	def create
		@votecomm = VoteComm.new(votecomm_params)

		if VoteComm.where(user: current_user, comment: Comment.find(params[:id])).count > 0
			VoteComm.where(user: current_user, comment: Comment.find(params[:id])).destroy_all
		end

		@votecomm.user = current_user
		@votecomm.comment = Comment.find(params[:id])

		if @votecomm.save 
			flash[:success] = "Iruzkina ondo bozkatu da!"
			redirect_to image_path
	        # render html: "BAI :D"
	    else
	    	render 'new'
		    # render html: "Ez :("
		end	
	end

	def self.getnew
		VoteComm.new
	end

	def self.gettotal(id)
		VoteComm.where(positive: 1, comment: Comment.find(id)).count - VoteComm.where(positive: 0, comment: Comment.find(id)).count
	end

	private
	def votecomm_params
		params.require(:vote_comm).permit(:positive, :comment_id)
	end

end

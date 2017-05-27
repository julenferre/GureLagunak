class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :image
	
	has_many :vote_imgs, dependent: :destroy
    has_many :vote_comms, dependent: :destroy
end

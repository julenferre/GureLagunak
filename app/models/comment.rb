class Comment < ApplicationRecord
    belongs_to :user
	belongs_to :image
	has_many :vote_comms
end

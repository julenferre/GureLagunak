class Image < ApplicationRecord
    belongs_to :user
	has_many :tags
	has_many :vote_imgs
	has_many :comments
end

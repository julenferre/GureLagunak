class User < ApplicationRecord
    has_many :images
    has_many :comments
    has_many :vote_imgs
    has_many :vote_comms
end

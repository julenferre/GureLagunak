class User < ApplicationRecord
	has_many :images
	has_many :comments
	has_many :vote_imgs
	has_many :vote_comms

	# Pasahitza konfirmatzeko
	validates_confirmation_of :password

	# Irudia
	has_attached_file :profile_pic
	attr_accessor :profile_pic

end

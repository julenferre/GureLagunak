class User < ApplicationRecord
	has_many :images
	has_many :comments
	has_many :vote_imgs
	has_many :vote_comms

	# Nickname bakarra egon behar da
	validates_uniqueness_of :nickname

	# Eposta helbidea letra txikiz
	before_save { self.email = email.downcase }

	# REGEX: nickname
	validates :nickname, presence: true, length: { maximum: 50 }

	# REGEX: eposta
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
	                format: { with: VALID_EMAIL_REGEX },
	                uniqueness: { case_sensitive: false }

	# Pasahitza babestua
	has_secure_password

	# REGEX: pasahitza
	validates :password_digest, presence: true, length: { minimum: 6 }

	# Pasahitza konfirmatzeko
	validates_confirmation_of :password_digest

	# Irudia
	has_attached_file :profile_pic

	# Soilik irudiak hartzeko (eta ez beste motako artxiborik)
	validates_attachment :profile_pic,
                     content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

    # Igotzerakoan, irudi guztiek formatu berdina euki ditzaten
    has_attached_file :image, styles: { thumb: ["64x64#", :jpg] }

end

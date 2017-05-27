class Image < ApplicationRecord
	belongs_to :user

	has_many :comments, dependent: :destroy
    has_many :vote_imgs, dependent: :destroy
    has_many :vote_comms, dependent: :destroy

	# Irudia
	has_attached_file :img

	# Soilik irudiak hartzeko (eta ez beste motako artxiborik)
	validates_attachment :img,
                     content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

    # Igotzerakoan, irudi guztiek formatu berdina euki ditzaten
    has_attached_file :img, styles: { thumb: ["64x64#", :jpg] }
end

class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.has_many :vote_imgs, dependent: :destroy
      t.has_many :vote_comms, dependent: :destroy

      t.belongs_to :user, index: true
	  t.belongs_to :image, index: true

      t.string :text

      t.timestamps
    end
  end
end

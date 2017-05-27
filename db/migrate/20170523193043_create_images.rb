class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.has_many :comments, dependent: :destroy
      t.has_many :vote_imgs, dependent: :destroy
      t.has_many :vote_comms, dependent: :destroy

      t.belongs_to :user, index: true

      t.string :title

      t.timestamps
    end
  end
end

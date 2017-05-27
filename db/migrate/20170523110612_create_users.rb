class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|     
      t.has_many :images, dependent: :destroy
      t.has_many :comments, dependent: :destroy
      t.has_many :vote_imgs, dependent: :destroy
      t.has_many :vote_comms, dependent: :destroy

      t.string :nickname
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end

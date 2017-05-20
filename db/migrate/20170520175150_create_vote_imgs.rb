class CreateVoteImgs < ActiveRecord::Migration[5.0]
  def change
    create_table :vote_imgs do |t|
      t.integer :positive
      t.datetime :datetime

      t.timestamps
    end
  end
end

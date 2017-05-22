class CreateVoteImgs < ActiveRecord::Migration[5.0]
  def change
    create_table :vote_imgs do |t|

      t.timestamps
    end
  end
end

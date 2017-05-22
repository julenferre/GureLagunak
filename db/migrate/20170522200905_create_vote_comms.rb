class CreateVoteComms < ActiveRecord::Migration[5.0]
  def change
    create_table :vote_comms do |t|

      t.timestamps
    end
  end
end

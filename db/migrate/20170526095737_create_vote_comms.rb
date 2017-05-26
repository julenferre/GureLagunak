class CreateVoteComms < ActiveRecord::Migration[5.0]
  def change
    create_table :vote_comms do |t|
      t.belongs_to :user
	  t.belongs_to :comment

      t.integer :positive

      t.timestamps
    end
  end
end

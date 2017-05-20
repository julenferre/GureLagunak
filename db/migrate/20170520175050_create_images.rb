class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.binary :img
      t.datetime :datetime

      t.timestamps
    end
  end
end

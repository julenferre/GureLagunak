class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      
      t.belongs_to :user, index: true

      t.string :title

      t.timestamps
    end
  end
end

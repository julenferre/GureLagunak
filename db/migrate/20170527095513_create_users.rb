class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    drop_table :users
    create_table :users do |t|      

      t.string :nickname
      t.string :email
      t.string :password_digest
      t.integer :admin

      t.timestamps
    end
  end
end

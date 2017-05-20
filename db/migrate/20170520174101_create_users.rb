class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :email
      t.string :password
      t.datetime :join_date
      t.datetime :last_login

      t.timestamps
    end
  end
end

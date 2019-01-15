class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password, null: false
      t.string :fname
      t.string :lname
      t.string :password_digest
    end
  end
end

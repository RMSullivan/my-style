class CreateImages < ActiveRecord::Migration
  def change
  	create_table :images do |t|
  		t.string :style
  		t.text :brand
  		t.integer :user_id
  		t.string :picture
  	end
  end
end

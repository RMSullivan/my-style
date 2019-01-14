class CreateImages < ActiveRecord::Migration
  def change
  	create_table :uploads do |t|
  		t.string "title", null: false
    	t.string :image_url, null: false
    	t.timestamps

  end
end
end

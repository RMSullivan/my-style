class CreateImages < ActiveRecord::Migration
  def change
  	create_table :uploads do |t|
  		t.string "title"
    	t.string :image_url
    	t.timestamps

  end
end
end

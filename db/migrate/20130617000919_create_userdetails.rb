class CreateUserdetails < ActiveRecord::Migration
  def change
  	
  	create_table :userdetails do |t|
  		t.integer :user_id
  		t.string :firstname
  		t.string :lastname
  		t.integer :passcode
  		t.string :url

  		t.timestamps
  	end

  end
end

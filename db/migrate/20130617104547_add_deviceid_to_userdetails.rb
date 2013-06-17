class AddDeviceidToUserdetails < ActiveRecord::Migration
  def change
  	add_column :userdetails, :device_id, :integer
  end
end

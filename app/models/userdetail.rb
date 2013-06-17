class Userdetail < ActiveRecord::Base

	belongs_to :user
	attr_accessible :firstname, :lastname, :url, :passcode, :user_id, :device_id
	validates :firstname, :lastname, presence: true

end


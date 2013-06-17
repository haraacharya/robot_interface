ActiveAdmin.register Userdetail do
	
	index do
		column :user
		column :firstname
		column :lastname
		column :passcode

		column :device_id
		column :url
	
		default_actions
	end	

	form do |f|                         
			f.inputs "Useretails" do       
			f.input :user                  
			f.input :firstname
			f.input :lastname
			f.input :url
			f.input :device_id
		end                               
		f.actions                         
	end

end

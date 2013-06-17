ActiveAdmin.register Userdetail do
	
	index do
		column :user
		column :firstname
		column :lastname
		column :url
		column :passcode

		default_actions
	end	

	form do |f|                         
			f.inputs "Useretails" do       
			f.input :user                  
			f.input :firstname
			f.input :lastname
			f.input :url
		end                               
		f.actions                         
	end

end

class MainController < ApplicationController
  
	def index

		if user_signed_in?
			if current_user.userdetail.nil? 
				@userdetail = Userdetail.new
				redirect_to new_userdetail_path
			else
				@userdetail = current_user.userdetail	
			end
		end
	end

	def info
		render :layout => "static"
	end

	def faq
		render :layout => "static"
	end

end

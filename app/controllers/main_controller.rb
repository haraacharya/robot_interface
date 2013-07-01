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

	def new

	end

	def client
		passcode = params[:passcode]
		
		if !User.find_by_id(params[:user_id]).nil?
			@user = User.find(params[:user_id])
			if @user.userdetail.passcode.to_i == passcode.to_i
				redirect_to userdetail_path(@user.userdetail)
			else
				redirect_to info_path, notice: "You don't have access to it"
			end	
		else
			redirect_to info_path, notice: "You don't have access to it"
		end	
		
	end

end

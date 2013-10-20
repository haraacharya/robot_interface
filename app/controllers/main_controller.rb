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
		if (!User.find_by_id(params[:user_id]).nil? && params[:passcode].length > 0)
			@user = User.find(params[:user_id])
			#@passcode = params[:passcode]
			#if @user.userdetail.passcode.to_i == passcode.to_i
				redirect_to userdetail_path(@user.userdetail, :passcode => params[:passcode])
			#else
			#	redirect_to info_path, notice: "You don't have access to it client1"
			#end	
		else
			redirect_to info_path, notice: "Please enter correct profile ID / Password."
		end	
		
	end

end

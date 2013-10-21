class UserdetailsController < ApplicationController
	require 'rest_client'
	layout 'application', :only => [:new, :create, :update]

	def new
		@userdetail = Userdetail.new	
	end

	def create
		@userdetail = Userdetail.new(params[:userdetail])
		@userdetail.user = current_user
		@userdetail.passcode = rand(11111...99999)
		if @userdetail.save
			redirect_to root_path, notice: "Updated Successfully"
		else
			render	"new"
		end	
	end

	def update
		@user = current_user
		@userdetail = @user.userdetail
		@userdetail.passcode = rand(11111...99999)

		if @userdetail.update_attributes(params[:userdetail])
			redirect_to root_path, notice: "Updated successfully"
		else
			render "edit", error: "There might be some problem updating it now"
		end	

	end

	def show
		@userdetail = Userdetail.find(params[:id])
		@user = @userdetail.user
		
		#if params.has_key?(:one)
			if params[:passcode].to_i != @userdetail.passcode.to_i
				redirect_to info_path, notice: "Sorry, you don't have access to it."	
			else
				render :layout => "special"
			end
		# else
		# 	if params[:passcode].to_i != @userdetail.passcode.to_i
		# 		redirect_to info_path, notice: "You don't have access to it from client"
		# 	else	
		# 		render :layout => "special"
		# 	end	
		#end		

	end

	def index		
		@userdetails = Userdetail.all
		respond_to do |format|
    		format.html
    		format.json { render json: @userdetails }
  		end
	end

	def button_action
		@userdetail = Userdetail.find(params[:userdetail_id])
		@value = params[:value]
    	response = RestClient.get(@userdetail.url , {'value' => @value})
    end

    def send_mail
    	email_id = params[:email]
		@userdetail = Userdetail.find(params[:userdetail_id])
		#@user_url = userdetail_url(@userdetail) + "?passcode=" + @userdetail.passcode.to_s

    	UserMailer.send_dildoaccess(email_id, @userdetail).deliver
    	redirect_to root_path, notice: "Email has been sent"	
    end


end
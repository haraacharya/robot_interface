module Api

  module V1
  	
    class UserdetailsController < ApplicationController
    	respond_to :json
    	def index
    		respond_with Userdetail.all
    	end

    	def show
    		respond_with Userdetail.find(params[:id])
    	end

    	def button_action
    		value = params[:value]
    		@userdetail = Userdetail.find(params[:id])
    		curl @userdetail.url + "?value=" + value	
    	end

    end

  end

end
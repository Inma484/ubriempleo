class UserController < ApplicationController
	
	load_and_authorize_resource
	
	def create
		@user = User.new(user_params)
	end


	private
	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation, :role )
	end


 
end

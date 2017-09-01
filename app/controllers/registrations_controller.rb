class RegistrationsController < Devise::RegistrationsController
	def new
		super
	end

	def create
		super
	end

	def update
		super
	end

	

	private
	def sign_up_params
		#allow = [:email, :password, :password_confirmation, :role]
		params.require(resource_name).permit(:email, :password, :password_confirmation, :role)
	end
end
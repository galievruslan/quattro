class AdministrationController < ApplicationController
	before_filter :login_required
	layout "administration"

	def index
	end

	def login_required
    	redirect_to('/users/sign_in') if !user_signed_in?
  	end
end

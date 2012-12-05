class AdministrationController < ApplicationController
	before_filter :authenticate_user!
	layout 'administration'
end

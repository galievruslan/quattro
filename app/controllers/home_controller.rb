class DashboardController < ApplicationController
  def index
  	@contacts = Contact.find(:all)
  	@projects = Project.find(:all)  	
  end
end

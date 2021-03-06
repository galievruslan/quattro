class PagesController < ApplicationController
  def home
    @title="Home"
    @projects = Project.find(:all)     
    @action_registration = ActionRegistration.new 
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end    
  end
  def contact
    @title="Contact"
    @contacts = Contact.all
  end
  def about
    @title="About Us"
  end
  def projects
    @title="Projects"
    @projects = Project.all
  end
  def logon
    @title="Logon"
  end
end

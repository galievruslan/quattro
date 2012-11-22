class PagesController < ApplicationController
  def home
    @title="Home"
  end
  def contact
    @title="Contact"
    @contacts = Contact.find(:all)
  end
  def about
    @title="About Us"
  end
  def projects
    @title="Projects"
    @projects = Project.find(:all) 
  end
end

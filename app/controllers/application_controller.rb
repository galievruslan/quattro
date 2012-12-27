class ApplicationController < ActionController::Base
  protect_from_forgery
  #layout "application"
  layout :layout

  def routing_error
      render "public/404", :status => 404
  end

  private

  def layout
    if devise_controller? && devise_mapping.name == :user
      "logon"
    else
      "application"
    end
  end
end

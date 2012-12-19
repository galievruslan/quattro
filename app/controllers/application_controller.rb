class ApplicationController < ActionController::Base
  protect_from_forgery
  #layout "application"
  layout :layout

  private

  def layout
    if devise_controller? && devise_mapping.name == :user
      "logon"
    else
      "application"
    end
  end
end

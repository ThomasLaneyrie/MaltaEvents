class ApplicationController < ActionController::Base
  protected
  def configure_permitted_paramters
    devise_parameter
  end
end

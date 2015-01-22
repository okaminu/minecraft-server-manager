class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  protected
  def redirectToDefault
    redirect_to controller:'control_panel', action:'show'
  end
end

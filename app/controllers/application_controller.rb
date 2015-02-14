class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  http_basic_authenticate_with name: APP_CONFIG['authentication']['username'],
                               password: APP_CONFIG['authentication']['password']

  protect_from_forgery with: :exception
  def redirect_to_default
    redirect_to controller:'control_panel', action:'show'
  end
end

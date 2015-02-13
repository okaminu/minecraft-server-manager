class ServerController < ApplicationController

  def stop
    get_server_control.stop
    redirect_to_default
  end

  def start
    get_server_control.start
    redirect_to_default
  end

  def restart
    get_server_control.restart
    redirect_to_default
  end

  private

  def get_server_control
    Server.new(params[:server_name], APP_CONFIG['restart_duration_in_seconds'])
  end

end

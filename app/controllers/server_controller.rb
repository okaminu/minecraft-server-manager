class ServerController < ApplicationController

  def stop
    get_server_control(params[:server_name]).stop
    redirect_to_default
  end

  def start
    get_server_control(params[:server_name]).start
    redirect_to_default
  end

  def restart
    get_server_control(params[:server_name]).restart
    redirect_to_default
  end

  private

  def get_server_control server_name
    Server.new(server_name, APP_CONFIG['restart_duration_in_seconds'])
  end

end

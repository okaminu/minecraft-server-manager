class ServerController < ApplicationController

  def stop
    get_server.stop
    redirect_to_default
  end

  def start
    get_server.start
    redirect_to_default
  end

  def restart
    get_server.restart
    redirect_to_default
  end

  private

  def get_server
    Server.new(APP_CONFIG['restart_duration_in_seconds'], params[:server_name])
  end

end

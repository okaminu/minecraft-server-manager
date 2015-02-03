class ServerController < ApplicationController

  def stop
    get_server_control.stop
    redirectToDefault
  end

  def start
    get_server_control.start
    redirectToDefault
  end

  def restart
    get_server_control.restart
    redirectToDefault
  end

  private

  def get_server_control
    Server.new(APP_CONFIG['server_name'], APP_CONFIG['restart_duration_in_seconds'])
  end

end

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

  def backup
    get_server.stop
    get_archiver.backup params[:server_name]
    get_server.start
    redirect_to_default
  end

  private

  def get_archiver
    Archiver.new(APP_CONFIG['server_root'], APP_CONFIG['s3_archive_location'])
  end

  def get_server
    Server.new(params[:server_name])
  end

end

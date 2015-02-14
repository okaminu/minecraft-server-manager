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
    `zip -r minecraft_server_backup.zip /srv/minecraft/#{params[:server_name]}`
    `aws s3 cp minecraft_server_backup.zip s3://aurimasdegutis/Archive/Minecraft\\ Server\\ Backups/minecraft_server_#{params[:server_name]}_#{Time.now.strftime("%Y_%m_%d")}.zip`
    `rm minecraft_server_backup.zip`
    get_server.start
    redirect_to_default
  end

  private

  def get_server
    Server.new(APP_CONFIG['restart_duration_in_seconds'], params[:server_name])
  end

end

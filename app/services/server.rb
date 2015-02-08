class Server

  def initialize(server_name, restart_duration)
    @server_name = server_name
    @restart_duration = restart_duration
  end

  def restart
    stop
    sleep @restart_duration
    start
  end

  def start
    system 'systemctl start '+@server_name
  end

  def stop
    system 'systemctl stop '+@server_name
  end

end
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
    `systemctl start #{@server_name}`
  end

  def stop
    `systemctl stop #{@server_name}`
  end

  def is_active
    status = `systemctl status #{@server_name}`

    if status
      return is_running_match status
    end

    false
  end

  private

  def is_running_match status
    m = status.match 'active \(running\)'
    if m
      return true
    end
    false
  end

end
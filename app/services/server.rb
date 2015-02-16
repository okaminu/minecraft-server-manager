class Server

  def initialize(server_name)
    @server_name = server_name
  end

  def start
    `systemctl start minecraft_#{@server_name}`
  end

  def stop
    `systemctl stop minecraft_#{@server_name}`
    end

  def restart
    `systemctl restart minecraft_#{@server_name}`
  end

  def is_active
    status = `systemctl status minecraft_#{@server_name}`

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
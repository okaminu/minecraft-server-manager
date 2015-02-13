class Properties

  def initialize(server_root)
    @server_root = server_root
  end

  def read_server_properties(server_name)
    full_path = "#{@server_root}/#{server_name}/server.properties"
    JavaProperties.load full_path
  end

  def save_server_properties(properties, server_name)
    full_path = "#{@server_root}/#{server_name}/server.properties"
    JavaProperties.write properties, full_path
  end

end
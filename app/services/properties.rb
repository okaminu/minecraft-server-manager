class Properties

  def initialize(server_root, server_name)
    @full_path = "#{server_root}/#{server_name}/server.properties"
  end

  def read_server_properties
    JavaProperties.load @full_path
  end

  def save_server_properties(properties)
    JavaProperties.write properties, @full_path
  end

end
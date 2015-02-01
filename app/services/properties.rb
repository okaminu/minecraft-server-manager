class Properties

  def initialize(location)
    @server_properties_location = location
  end

  def read_server_properties
    JavaProperties.load @server_properties_location
  end

  def save_server_properties(properties)
    JavaProperties.write properties, @server_properties_location
  end

end
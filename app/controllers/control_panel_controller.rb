class ControlPanelController < ApplicationController

  def initialize
    @editable_properties = APP_CONFIG['editable_server_properties'].map{|x| x.to_sym}
    @info_properties = APP_CONFIG['info_server_properties'].map{|x| x.to_sym}
    @properties_service = Properties.new(APP_CONFIG['property_file_location'])
    super
  end

  def show
    @properties_view = @properties_service.read_server_properties.slice(*@editable_properties)
    @server_info = get_server_info
  end

  def save
    updated_properties = @properties_service.read_server_properties.deep_merge(params.symbolize_keys)
    @properties_service.save_server_properties updated_properties
    restart_server
    redirect_to_default
  end

  private

  def restart_server
    get_server.restart
  end

  def get_server
    Server.new(APP_CONFIG['server_name'], APP_CONFIG['restart_duration_in_seconds'])
  end

  def get_server_info
    server_properties = @properties_service.read_server_properties.slice(*@info_properties)
    server_properties.merge({ :is_active => get_server.is_active })
  end

end

class ControlPanelController < ApplicationController

  def initialize
    @editable_properties = APP_CONFIG['editable_server_properties'].map{|x| x.to_sym}
    @info_properties = APP_CONFIG['info_server_properties'].map{|x| x.to_sym}
    super
  end

  def show
    @properties_view = get_property_service.read_server_properties.slice(*@editable_properties)
    @server_info = get_server_info
  end

  def save
    updated_properties = get_property_service.read_server_properties.deep_merge(params.symbolize_keys)
    get_property_service.save_server_properties(updated_properties)
    get_server.restart
    redirect_to_default
  end

  private

  def get_server_info
    server_properties = get_property_service.read_server_properties.slice(*@info_properties)
    server_properties.merge({ :is_active => get_server.is_active })
  end

  def get_server
    Server.new(APP_CONFIG['restart_duration_in_seconds'], params[:server_name])
  end

  def get_property_service
    Properties.new(APP_CONFIG['server_root'], params[:server_name])
  end

end

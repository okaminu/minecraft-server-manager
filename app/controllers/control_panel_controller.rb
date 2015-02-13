class ControlPanelController < ApplicationController

  def initialize
    @editable_properties = APP_CONFIG['editable_server_properties'].map{|x| x.to_sym}
    @info_properties = APP_CONFIG['info_server_properties'].map{|x| x.to_sym}
    @properties_service = Properties.new(APP_CONFIG['server_root'])
    super
  end

  def show
    @properties_view = @properties_service.read_server_properties(params[:server_name]).slice(*@editable_properties)
    @server_info = get_server_info params[:server_name]
  end

  def save
    updated_properties = @properties_service.read_server_properties(params[:server_name]).deep_merge(params.symbolize_keys)
    @properties_service.save_server_properties(updated_properties, params[:server_name])
    restart_server params[:server_name]
    redirect_to_default
  end

  private

  def restart_server(server_name)
    get_server(server_name).restart
  end

  def get_server(server_name)
    Server.new(server_name, APP_CONFIG['restart_duration_in_seconds'])
  end

  def get_server_info server_name
    server_properties = @properties_service.read_server_properties(server_name).slice(*@info_properties)
    server_properties.merge({ :is_active => get_server(server_name).is_active })
  end

end

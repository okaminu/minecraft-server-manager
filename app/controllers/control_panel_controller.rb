class ControlPanelController < ApplicationController

  def initialize
    @editable_properties = APP_CONFIG['editable_server_properties'].map{|x| x.to_sym}
    @properties_service = Properties.new(APP_CONFIG['property_file_location'])
  end

  def show
    @properties_view = @properties_service.read_server_properties.slice(*@editable_properties)
  end

  def save
    updated_properties = @properties_service.read_server_properties.deep_merge(params.symbolize_keys)
    @properties_service.save_server_properties updated_properties
    redirectToDefault
  end

end

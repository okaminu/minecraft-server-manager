class ControlPanelController < ApplicationController

  def initialize
    # Move these to configuration in /config
    # See http://richonrails.com/articles/the-rails-4-1-secrets-yml-file
    property_file_location = '/Users/mac/Desktop/Aurimas/minecraft/server.properties'
    @editable_properties = [:difficulty, :'view-distance']

    @properties_service = Properties.new(property_file_location)
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

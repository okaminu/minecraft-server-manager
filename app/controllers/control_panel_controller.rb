class ControlPanelController < ApplicationController

  def initialize
    @serverPropertiesLocation = '/Users/mac/Desktop/Aurimas/minecraft/server.properties'
  end

  def show
    @properties = JavaProperties.load @serverPropertiesLocation
  end

  def save
    properties = JavaProperties.load @serverPropertiesLocation
    JavaProperties.write properties, @serverPropertiesLocation
    redirectToDefault
  end
end

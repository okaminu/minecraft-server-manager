class ControlPanelController < ApplicationController

  def initialize
    @serverPropertiesLocation = '/Users/mac/Desktop/Aurimas/minecraft/server.properties'
  end
  def show
    properties = JavaProperties.load @serverPropertiesLocation
    properties[:difficulty] = 1
    JavaProperties.write properties, @serverPropertiesLocation
  end

  def save
    redirectToDefault
  end
end

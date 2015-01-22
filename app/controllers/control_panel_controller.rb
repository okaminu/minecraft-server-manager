class ControlPanelController < ApplicationController
  def show
    settingsText = String.new
    file = File.new '/Users/mac/Desktop/Aurimas/minecraft/server.properties', 'r'
    while line = file.gets
      settingsText << line
    end
    file.close
  end

  def save
    settingsText = String.new
    file = File.new '/Users/mac/Desktop/Aurimas/minecraft/server.properties', 'r'
    while line = file.gets
      settingsText << line
    end
    file.close

    settingsText << 'lol'
    file = File.new '/Users/mac/Desktop/Aurimas/minecraft/server.properties', 'w'
    file.write settingsText
    file.close
  end
end

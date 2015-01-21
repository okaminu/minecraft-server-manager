class ServerController < ApplicationController
  def stop
    system 'systemctl stop minecraft_blueskies'
  end

  def start
    system 'systemctl start minecraft_blueskies'
  end
end

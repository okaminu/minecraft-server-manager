class ServerController < ApplicationController

  def stop
    system 'systemctl stop minecraft_blueskies'
    redirectToDefault
  end

  def start
    system 'systemctl start minecraft_blueskies'
    redirectToDefault
  end

end

require 'test_helper'

class ControlPanelControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

end

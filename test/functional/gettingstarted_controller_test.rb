require 'test_helper'

class GettingstartedControllerTest < ActionController::TestCase
  test "should get step1" do
    get :step1
    assert_response :success
  end

end

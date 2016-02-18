require 'test_helper'

class SliderControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

end

require 'test_helper'

class ConsumerControllerTest < ActionController::TestCase
  test "should get check_service" do
    get :check_service
    assert_response :success
  end

end

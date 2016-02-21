require 'test_helper'

class EventsFlowsTest < ActionDispatch::IntegrationTest
  test "event fired" do
    get '/'
    assert_response :success
  end
end

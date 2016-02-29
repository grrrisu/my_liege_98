require 'test_helper'

class EventsFlowsTest < ActionDispatch::IntegrationTest
  test "event fired" do
    assert_difference("FireWorker.jobs.size", 1) do
      get test_fire_event_path
      assert_response :success
    end
  end
end

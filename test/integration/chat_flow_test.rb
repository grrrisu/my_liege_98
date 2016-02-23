require 'test_helper'

class ChatFlowTest < ActionDispatch::IntegrationTest

  setup do
    Capybara.current_driver = Capybara.javascript_driver # :selenium by default
  end

  test "should get show" do
    visit rooms_path
    #assert_response :success
    assert_includes(response.body, 'eins')
    assert_includes(response.body, 'zwei')
    assert_not_includes(response.body, 'drei')

    fill_in 'name', with: 'drei'
    assert_includes(response.body, 'drei')
  end

end

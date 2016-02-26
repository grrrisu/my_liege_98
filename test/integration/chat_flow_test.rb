require 'test_helper'

class ChatFlowTest < ActionDispatch::IntegrationTest

  setup do
    Capybara.current_driver = Capybara.javascript_driver # :selenium by default
  end

  test "should get show" do
    visit rooms_path
    #assert_response :success
    page.assert_text('eins')
    page.assert_text('zwei')
    page.assert_no_text('drei')

    Sidekiq::Testing.inline! do
      fill_in 'message', with: "drei\n"
      page.assert_text('drei')
    end
  end

end

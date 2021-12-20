require "test_helper"

class CyclesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get cycles_show_url
    assert_response :success
  end
end

require "test_helper"

class GoodHabitsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get good_habits_index_url
    assert_response :success
  end

  test "should get show" do
    get good_habits_show_url
    assert_response :success
  end
end

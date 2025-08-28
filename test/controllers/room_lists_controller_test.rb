require "test_helper"

class RoomListsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get room_lists_index_url
    assert_response :success
  end

  test "should get new" do
    get room_lists_new_url
    assert_response :success
  end

  test "should get show" do
    get room_lists_show_url
    assert_response :success
  end
end

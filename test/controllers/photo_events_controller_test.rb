require "test_helper"

class PhotoEventsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get photo_events_create_url
    assert_response :success
  end
end

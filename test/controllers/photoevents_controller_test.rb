require "test_helper"

class PhotoeventsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get photoevents_create_url
    assert_response :success
  end
end

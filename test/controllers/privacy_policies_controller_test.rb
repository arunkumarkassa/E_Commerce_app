require "test_helper"

class PrivacyPoliciesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get privacy_policies_index_url
    assert_response :success
  end

  test "should get show" do
    get privacy_policies_show_url
    assert_response :success
  end
end

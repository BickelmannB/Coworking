require 'test_helper'

class ApisControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get apis_index_url
    assert_response :success
  end

end

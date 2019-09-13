require 'test_helper'

class AjaxControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ajax_index_url
    assert_response :success
  end

end

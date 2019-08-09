require 'test_helper'

class WorkplacesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get workplaces_new_url
    assert_response :success
  end

  test "should get create" do
    get workplaces_create_url
    assert_response :success
  end

  test "should get edit" do
    get workplaces_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get workplaces_destroy_url
    assert_response :success
  end

end

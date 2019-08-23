require 'test_helper'

class WorkplacesControllerTest < ActionDispatch::IntegrationTest
include Devise::Test::IntegrationHelpers
  fixtures :users
  # Setup

  def setup
    sign_in users(:brice)
  end

  # Validations tests

  test "should not save workplace without name" do
    workplace = Workplace.new
    workplace.total_places = 6
    workplace.description = "lorem ipseupm"
    assert_not workplace.save
  end

  test "should not save workplace without total places" do
    workplace = Workplace.new
    workplace.name = "toto"
    workplace.description = "lorem ipsum"
    assert_not workplace.save
  end

  test "should not save workplace without description" do
    workplace = Workplace.new
    workplace.name = "jojo"
    workplace.total_places = 6
    assert_not workplace.save
  end

  test "total place should be an integer" do
    workplace = Workplace.new
    workplace.name = "jojo"
    workplace.total_places = "erreur_should_be_here"
    workplace.description = "lorem ipsum"
    assert_not workplace.save
  end

  test "description max lenght is 70 char" do
    workplace = Workplace.new
    workplace.name = "jojo"
    workplace.total_places = 5
    workplace.description = "this sentence is more than 70 characters so the test will be fall..normaly "
    assert_not workplace.save
  end

  # Methods tests

  test "should get index" do
    get workplaces_url
    assert_response :success
    assert Workplace.all
    assert_response :success
  end

  test "should get new" do
    get new_workplace_url
    assert_response :success
  end

  test "shouled get create" do
   post workplaces_url, params: { workplace: { name: "place", total_places: 9, photo: "pic", description: "best place ever" } }
   get workplace_url(Workplace.last)
   assert_response :success
  end

  test "should get show" do
    workplace = Workplace.new(name: "tot", total_places: 4, photo: "my pic", description: "dodo")
    workplace.save
    get workplace_url(workplace)
    assert_response :success
  end

  test "should get edit" do
    workplace = Workplace.new(name: "tot", total_places: 4, photo: "my pic", description: "dodo")
    workplace.save
    get edit_workplace_url(workplace)
    assert_response :success
  end


  test "should destroy" do
    workplace = Workplace.create(name: "tot", total_places: 4, photo: "my pic", description: "dodo")
    assert workplace.destroy
  end
end

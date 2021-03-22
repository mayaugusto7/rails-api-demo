require "test_helper"

class Api::V1::PetsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_pets_index_url
    assert_response :success
  end

  test "should get show" do
    get api_v1_pets_show_url
    assert_response :success
  end

  test "should get new" do
    get api_v1_pets_new_url
    assert_response :success
  end

  test "should get edit" do
    get api_v1_pets_edit_url
    assert_response :success
  end

  test "should get create" do
    get api_v1_pets_create_url
    assert_response :success
  end

  test "should get update" do
    get api_v1_pets_update_url
    assert_response :success
  end

  test "should get destroy" do
    get api_v1_pets_destroy_url
    assert_response :success
  end
end

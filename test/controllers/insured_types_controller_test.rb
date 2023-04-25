require "test_helper"

class InsuredTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @insured_type = insured_types(:one)
  end

  test "should get index" do
    get insured_types_url
    assert_response :success
  end

  test "should get new" do
    get new_insured_type_url
    assert_response :success
  end

  test "should create insured_type" do
    assert_difference("InsuredType.count") do
      post insured_types_url, params: { insured_type: { description: @insured_type.description, name: @insured_type.name } }
    end

    assert_redirected_to insured_type_url(InsuredType.last)
  end

  test "should show insured_type" do
    get insured_type_url(@insured_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_insured_type_url(@insured_type)
    assert_response :success
  end

  test "should update insured_type" do
    patch insured_type_url(@insured_type), params: { insured_type: { description: @insured_type.description, name: @insured_type.name } }
    assert_redirected_to insured_type_url(@insured_type)
  end

  test "should destroy insured_type" do
    assert_difference("InsuredType.count", -1) do
      delete insured_type_url(@insured_type)
    end

    assert_redirected_to insured_types_url
  end
end

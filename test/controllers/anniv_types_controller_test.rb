require "test_helper"

class AnnivTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @anniv_type = anniv_types(:one)
  end

  test "should get index" do
    get anniv_types_url
    assert_response :success
  end

  test "should get new" do
    get new_anniv_type_url
    assert_response :success
  end

  test "should create anniv_type" do
    assert_difference("AnnivType.count") do
      post anniv_types_url, params: { anniv_type: { name: @anniv_type.name } }
    end

    assert_redirected_to anniv_type_url(AnnivType.last)
  end

  test "should show anniv_type" do
    get anniv_type_url(@anniv_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_anniv_type_url(@anniv_type)
    assert_response :success
  end

  test "should update anniv_type" do
    patch anniv_type_url(@anniv_type), params: { anniv_type: { name: @anniv_type.name } }
    assert_redirected_to anniv_type_url(@anniv_type)
  end

  test "should destroy anniv_type" do
    assert_difference("AnnivType.count", -1) do
      delete anniv_type_url(@anniv_type)
    end

    assert_redirected_to anniv_types_url
  end
end

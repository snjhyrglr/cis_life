require "test_helper"

class ContestabilitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contestability = contestabilities(:one)
  end

  test "should get index" do
    get contestabilities_url
    assert_response :success
  end

  test "should get new" do
    get new_contestability_url
    assert_response :success
  end

  test "should create contestability" do
    assert_difference("Contestability.count") do
      post contestabilities_url, params: { contestability: { max_age: @contestability.max_age, member_type: @contestability.member_type, min_age: @contestability.min_age, period: @contestability.period, period_type: @contestability.period_type } }
    end

    assert_redirected_to contestability_url(Contestability.last)
  end

  test "should show contestability" do
    get contestability_url(@contestability)
    assert_response :success
  end

  test "should get edit" do
    get edit_contestability_url(@contestability)
    assert_response :success
  end

  test "should update contestability" do
    patch contestability_url(@contestability), params: { contestability: { max_age: @contestability.max_age, member_type: @contestability.member_type, min_age: @contestability.min_age, period: @contestability.period, period_type: @contestability.period_type } }
    assert_redirected_to contestability_url(@contestability)
  end

  test "should destroy contestability" do
    assert_difference("Contestability.count", -1) do
      delete contestability_url(@contestability)
    end

    assert_redirected_to contestabilities_url
  end
end

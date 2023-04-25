require "test_helper"

class OfficersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @officer = officers(:one)
  end

  test "should get index" do
    get officers_url
    assert_response :success
  end

  test "should get new" do
    get new_officer_url
    assert_response :success
  end

  test "should create officer" do
    assert_difference("Officer.count") do
      post officers_url, params: { officer: { active: @officer.active, birth_day: @officer.birth_day, designation: @officer.designation, first_name: @officer.first_name, last_name: @officer.last_name, middle_name: @officer.middle_name, suffx: @officer.suffx } }
    end

    assert_redirected_to officer_url(Officer.last)
  end

  test "should show officer" do
    get officer_url(@officer)
    assert_response :success
  end

  test "should get edit" do
    get edit_officer_url(@officer)
    assert_response :success
  end

  test "should update officer" do
    patch officer_url(@officer), params: { officer: { active: @officer.active, birth_day: @officer.birth_day, designation: @officer.designation, first_name: @officer.first_name, last_name: @officer.last_name, middle_name: @officer.middle_name, suffx: @officer.suffx } }
    assert_redirected_to officer_url(@officer)
  end

  test "should destroy officer" do
    assert_difference("Officer.count", -1) do
      delete officer_url(@officer)
    end

    assert_redirected_to officers_url
  end
end

require "test_helper"

class MoasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @moa = moas(:one)
  end

  test "should get index" do
    get moas_url
    assert_response :success
  end

  test "should get new" do
    get new_moa_url
    assert_response :success
  end

  test "should create moa" do
    assert_difference("Moa.count") do
      post moas_url, params: { moa: { moa_no: @moa.moa_no, moa_signed_date: @moa.moa_signed_date, notarized_date: @moa.notarized_date, proposal_id: @moa.proposal_id } }
    end

    assert_redirected_to moa_url(Moa.last)
  end

  test "should show moa" do
    get moa_url(@moa)
    assert_response :success
  end

  test "should get edit" do
    get edit_moa_url(@moa)
    assert_response :success
  end

  test "should update moa" do
    patch moa_url(@moa), params: { moa: { moa_no: @moa.moa_no, moa_signed_date: @moa.moa_signed_date, notarized_date: @moa.notarized_date, proposal_id: @moa.proposal_id } }
    assert_redirected_to moa_url(@moa)
  end

  test "should destroy moa" do
    assert_difference("Moa.count", -1) do
      delete moa_url(@moa)
    end

    assert_redirected_to moas_url
  end
end

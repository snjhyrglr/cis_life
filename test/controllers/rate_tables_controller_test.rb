require "test_helper"

class RateTablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rate_table = rate_tables(:one)
  end

  test "should get index" do
    get rate_tables_url
    assert_response :success
  end

  test "should get new" do
    get new_rate_table_url
    assert_response :success
  end

  test "should create rate_table" do
    assert_difference("RateTable.count") do
      post rate_tables_url, params: { rate_table: { count: @rate_table.count, gyrt_rate_id: @rate_table.gyrt_rate_id, proposal_id: @rate_table.proposal_id, qx: @rate_table.qx } }
    end

    assert_redirected_to rate_table_url(RateTable.last)
  end

  test "should show rate_table" do
    get rate_table_url(@rate_table)
    assert_response :success
  end

  test "should get edit" do
    get edit_rate_table_url(@rate_table)
    assert_response :success
  end

  test "should update rate_table" do
    patch rate_table_url(@rate_table), params: { rate_table: { count: @rate_table.count, gyrt_rate_id: @rate_table.gyrt_rate_id, proposal_id: @rate_table.proposal_id, qx: @rate_table.qx } }
    assert_redirected_to rate_table_url(@rate_table)
  end

  test "should destroy rate_table" do
    assert_difference("RateTable.count", -1) do
      delete rate_table_url(@rate_table)
    end

    assert_redirected_to rate_tables_url
  end
end

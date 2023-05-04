require "test_helper"

class BatchHealthDecsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @batch_health_dec = batch_health_decs(:one)
  end

  test "should get index" do
    get batch_health_decs_url
    assert_response :success
  end

  test "should get new" do
    get new_batch_health_dec_url
    assert_response :success
  end

  test "should create batch_health_dec" do
    assert_difference("BatchHealthDec.count") do
      post batch_health_decs_url, params: { batch_health_dec: { batch_id: @batch_health_dec.batch_id, health_dec_question_id: @batch_health_dec.health_dec_question_id, status: @batch_health_dec.status, sub_coverage: @batch_health_dec.sub_coverage, sub_prem: @batch_health_dec.sub_prem, sub_rate: @batch_health_dec.sub_rate } }
    end

    assert_redirected_to batch_health_dec_url(BatchHealthDec.last)
  end

  test "should show batch_health_dec" do
    get batch_health_dec_url(@batch_health_dec)
    assert_response :success
  end

  test "should get edit" do
    get edit_batch_health_dec_url(@batch_health_dec)
    assert_response :success
  end

  test "should update batch_health_dec" do
    patch batch_health_dec_url(@batch_health_dec), params: { batch_health_dec: { batch_id: @batch_health_dec.batch_id, health_dec_question_id: @batch_health_dec.health_dec_question_id, status: @batch_health_dec.status, sub_coverage: @batch_health_dec.sub_coverage, sub_prem: @batch_health_dec.sub_prem, sub_rate: @batch_health_dec.sub_rate } }
    assert_redirected_to batch_health_dec_url(@batch_health_dec)
  end

  test "should destroy batch_health_dec" do
    assert_difference("BatchHealthDec.count", -1) do
      delete batch_health_dec_url(@batch_health_dec)
    end

    assert_redirected_to batch_health_decs_url
  end
end

require "test_helper"

class ProposalInsuredLoadingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @proposal_insured_loading = proposal_insured_loadings(:one)
  end

  test "should get index" do
    get proposal_insured_loadings_url
    assert_response :success
  end

  test "should get new" do
    get new_proposal_insured_loading_url
    assert_response :success
  end

  test "should create proposal_insured_loading" do
    assert_difference("ProposalInsuredLoading.count") do
      post proposal_insured_loadings_url, params: { proposal_insured_loading: { gyrt_loading_id: @proposal_insured_loading.gyrt_loading_id, name: @proposal_insured_loading.name, proposal_insured_id: @proposal_insured_loading.proposal_insured_id, rate: @proposal_insured_loading.rate } }
    end

    assert_redirected_to proposal_insured_loading_url(ProposalInsuredLoading.last)
  end

  test "should show proposal_insured_loading" do
    get proposal_insured_loading_url(@proposal_insured_loading)
    assert_response :success
  end

  test "should get edit" do
    get edit_proposal_insured_loading_url(@proposal_insured_loading)
    assert_response :success
  end

  test "should update proposal_insured_loading" do
    patch proposal_insured_loading_url(@proposal_insured_loading), params: { proposal_insured_loading: { gyrt_loading_id: @proposal_insured_loading.gyrt_loading_id, name: @proposal_insured_loading.name, proposal_insured_id: @proposal_insured_loading.proposal_insured_id, rate: @proposal_insured_loading.rate } }
    assert_redirected_to proposal_insured_loading_url(@proposal_insured_loading)
  end

  test "should destroy proposal_insured_loading" do
    assert_difference("ProposalInsuredLoading.count", -1) do
      delete proposal_insured_loading_url(@proposal_insured_loading)
    end

    assert_redirected_to proposal_insured_loadings_url
  end
end

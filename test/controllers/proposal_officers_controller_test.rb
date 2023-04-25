require "test_helper"

class ProposalOfficersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @proposal_officer = proposal_officers(:one)
  end

  test "should get index" do
    get proposal_officers_url
    assert_response :success
  end

  test "should get new" do
    get new_proposal_officer_url
    assert_response :success
  end

  test "should create proposal_officer" do
    assert_difference("ProposalOfficer.count") do
      post proposal_officers_url, params: { proposal_officer: { officer_id: @proposal_officer.officer_id, proposal_id: @proposal_officer.proposal_id } }
    end

    assert_redirected_to proposal_officer_url(ProposalOfficer.last)
  end

  test "should show proposal_officer" do
    get proposal_officer_url(@proposal_officer)
    assert_response :success
  end

  test "should get edit" do
    get edit_proposal_officer_url(@proposal_officer)
    assert_response :success
  end

  test "should update proposal_officer" do
    patch proposal_officer_url(@proposal_officer), params: { proposal_officer: { officer_id: @proposal_officer.officer_id, proposal_id: @proposal_officer.proposal_id } }
    assert_redirected_to proposal_officer_url(@proposal_officer)
  end

  test "should destroy proposal_officer" do
    assert_difference("ProposalOfficer.count", -1) do
      delete proposal_officer_url(@proposal_officer)
    end

    assert_redirected_to proposal_officers_url
  end
end

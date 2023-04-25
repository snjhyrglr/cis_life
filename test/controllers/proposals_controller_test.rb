require "test_helper"

class ProposalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @proposal = proposals(:one)
  end

  test "should get index" do
    get proposals_url
    assert_response :success
  end

  test "should get new" do
    get new_proposal_url
    assert_response :success
  end

  test "should create proposal" do
    assert_difference("Proposal.count") do
      post proposals_url, params: { proposal: { actuarial_approval: @proposal.actuarial_approval, agent_approval: @proposal.agent_approval, agent_sf: @proposal.agent_sf, ave_age: @proposal.ave_age, coop_sf: @proposal.coop_sf, cooperative_id: @proposal.cooperative_id, member_count: @proposal.member_count, nel_amount: @proposal.nel_amount, new_max_age: @proposal.new_max_age, new_min_age: @proposal.new_min_age, nml_amount: @proposal.nml_amount, old_max_age: @proposal.old_max_age, old_min_age: @proposal.old_min_age, plan_id: @proposal.plan_id, proposal_no: @proposal.proposal_no, total_premium: @proposal.total_premium } }
    end

    assert_redirected_to proposal_url(Proposal.last)
  end

  test "should show proposal" do
    get proposal_url(@proposal)
    assert_response :success
  end

  test "should get edit" do
    get edit_proposal_url(@proposal)
    assert_response :success
  end

  test "should update proposal" do
    patch proposal_url(@proposal), params: { proposal: { actuarial_approval: @proposal.actuarial_approval, agent_approval: @proposal.agent_approval, agent_sf: @proposal.agent_sf, ave_age: @proposal.ave_age, coop_sf: @proposal.coop_sf, cooperative_id: @proposal.cooperative_id, member_count: @proposal.member_count, nel_amount: @proposal.nel_amount, new_max_age: @proposal.new_max_age, new_min_age: @proposal.new_min_age, nml_amount: @proposal.nml_amount, old_max_age: @proposal.old_max_age, old_min_age: @proposal.old_min_age, plan_id: @proposal.plan_id, proposal_no: @proposal.proposal_no, total_premium: @proposal.total_premium } }
    assert_redirected_to proposal_url(@proposal)
  end

  test "should destroy proposal" do
    assert_difference("Proposal.count", -1) do
      delete proposal_url(@proposal)
    end

    assert_redirected_to proposals_url
  end
end

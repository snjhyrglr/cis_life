require "test_helper"

class ProposalAnnivsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @proposal_anniv = proposal_annivs(:one)
  end

  test "should get index" do
    get proposal_annivs_url
    assert_response :success
  end

  test "should get new" do
    get new_proposal_anniv_url
    assert_response :success
  end

  test "should create proposal_anniv" do
    assert_difference("ProposalAnniv.count") do
      post proposal_annivs_url, params: { proposal_anniv: { anniv_type_id: @proposal_anniv.anniv_type_id, day: @proposal_anniv.day, mon: @proposal_anniv.mon, proposal_id: @proposal_anniv.proposal_id } }
    end

    assert_redirected_to proposal_anniv_url(ProposalAnniv.last)
  end

  test "should show proposal_anniv" do
    get proposal_anniv_url(@proposal_anniv)
    assert_response :success
  end

  test "should get edit" do
    get edit_proposal_anniv_url(@proposal_anniv)
    assert_response :success
  end

  test "should update proposal_anniv" do
    patch proposal_anniv_url(@proposal_anniv), params: { proposal_anniv: { anniv_type_id: @proposal_anniv.anniv_type_id, day: @proposal_anniv.day, mon: @proposal_anniv.mon, proposal_id: @proposal_anniv.proposal_id } }
    assert_redirected_to proposal_anniv_url(@proposal_anniv)
  end

  test "should destroy proposal_anniv" do
    assert_difference("ProposalAnniv.count", -1) do
      delete proposal_anniv_url(@proposal_anniv)
    end

    assert_redirected_to proposal_annivs_url
  end
end

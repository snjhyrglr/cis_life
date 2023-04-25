require "application_system_test_case"

class ProposalAnnivsTest < ApplicationSystemTestCase
  setup do
    @proposal_anniv = proposal_annivs(:one)
  end

  test "visiting the index" do
    visit proposal_annivs_url
    assert_selector "h1", text: "Proposal annivs"
  end

  test "should create proposal anniv" do
    visit proposal_annivs_url
    click_on "New proposal anniv"

    fill_in "Anniv type", with: @proposal_anniv.anniv_type_id
    fill_in "Day", with: @proposal_anniv.day
    fill_in "Mon", with: @proposal_anniv.mon
    fill_in "Proposal", with: @proposal_anniv.proposal_id
    click_on "Create Proposal anniv"

    assert_text "Proposal anniv was successfully created"
    click_on "Back"
  end

  test "should update Proposal anniv" do
    visit proposal_anniv_url(@proposal_anniv)
    click_on "Edit this proposal anniv", match: :first

    fill_in "Anniv type", with: @proposal_anniv.anniv_type_id
    fill_in "Day", with: @proposal_anniv.day
    fill_in "Mon", with: @proposal_anniv.mon
    fill_in "Proposal", with: @proposal_anniv.proposal_id
    click_on "Update Proposal anniv"

    assert_text "Proposal anniv was successfully updated"
    click_on "Back"
  end

  test "should destroy Proposal anniv" do
    visit proposal_anniv_url(@proposal_anniv)
    click_on "Destroy this proposal anniv", match: :first

    assert_text "Proposal anniv was successfully destroyed"
  end
end

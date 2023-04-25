require "application_system_test_case"

class ProposalOfficersTest < ApplicationSystemTestCase
  setup do
    @proposal_officer = proposal_officers(:one)
  end

  test "visiting the index" do
    visit proposal_officers_url
    assert_selector "h1", text: "Proposal officers"
  end

  test "should create proposal officer" do
    visit proposal_officers_url
    click_on "New proposal officer"

    fill_in "Officer", with: @proposal_officer.officer_id
    fill_in "Proposal", with: @proposal_officer.proposal_id
    click_on "Create Proposal officer"

    assert_text "Proposal officer was successfully created"
    click_on "Back"
  end

  test "should update Proposal officer" do
    visit proposal_officer_url(@proposal_officer)
    click_on "Edit this proposal officer", match: :first

    fill_in "Officer", with: @proposal_officer.officer_id
    fill_in "Proposal", with: @proposal_officer.proposal_id
    click_on "Update Proposal officer"

    assert_text "Proposal officer was successfully updated"
    click_on "Back"
  end

  test "should destroy Proposal officer" do
    visit proposal_officer_url(@proposal_officer)
    click_on "Destroy this proposal officer", match: :first

    assert_text "Proposal officer was successfully destroyed"
  end
end

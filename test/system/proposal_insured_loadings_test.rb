require "application_system_test_case"

class ProposalInsuredLoadingsTest < ApplicationSystemTestCase
  setup do
    @proposal_insured_loading = proposal_insured_loadings(:one)
  end

  test "visiting the index" do
    visit proposal_insured_loadings_url
    assert_selector "h1", text: "Proposal insured loadings"
  end

  test "should create proposal insured loading" do
    visit proposal_insured_loadings_url
    click_on "New proposal insured loading"

    fill_in "Gyrt loading", with: @proposal_insured_loading.gyrt_loading_id
    fill_in "Name", with: @proposal_insured_loading.name
    fill_in "Proposal insured", with: @proposal_insured_loading.proposal_insured_id
    fill_in "Rate", with: @proposal_insured_loading.rate
    click_on "Create Proposal insured loading"

    assert_text "Proposal insured loading was successfully created"
    click_on "Back"
  end

  test "should update Proposal insured loading" do
    visit proposal_insured_loading_url(@proposal_insured_loading)
    click_on "Edit this proposal insured loading", match: :first

    fill_in "Gyrt loading", with: @proposal_insured_loading.gyrt_loading_id
    fill_in "Name", with: @proposal_insured_loading.name
    fill_in "Proposal insured", with: @proposal_insured_loading.proposal_insured_id
    fill_in "Rate", with: @proposal_insured_loading.rate
    click_on "Update Proposal insured loading"

    assert_text "Proposal insured loading was successfully updated"
    click_on "Back"
  end

  test "should destroy Proposal insured loading" do
    visit proposal_insured_loading_url(@proposal_insured_loading)
    click_on "Destroy this proposal insured loading", match: :first

    assert_text "Proposal insured loading was successfully destroyed"
  end
end

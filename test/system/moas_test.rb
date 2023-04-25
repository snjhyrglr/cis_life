require "application_system_test_case"

class MoasTest < ApplicationSystemTestCase
  setup do
    @moa = moas(:one)
  end

  test "visiting the index" do
    visit moas_url
    assert_selector "h1", text: "Moas"
  end

  test "should create moa" do
    visit moas_url
    click_on "New moa"

    fill_in "Moa no", with: @moa.moa_no
    fill_in "Moa signed date", with: @moa.moa_signed_date
    fill_in "Notarized date", with: @moa.notarized_date
    fill_in "Proposal", with: @moa.proposal_id
    click_on "Create Moa"

    assert_text "Moa was successfully created"
    click_on "Back"
  end

  test "should update Moa" do
    visit moa_url(@moa)
    click_on "Edit this moa", match: :first

    fill_in "Moa no", with: @moa.moa_no
    fill_in "Moa signed date", with: @moa.moa_signed_date
    fill_in "Notarized date", with: @moa.notarized_date
    fill_in "Proposal", with: @moa.proposal_id
    click_on "Update Moa"

    assert_text "Moa was successfully updated"
    click_on "Back"
  end

  test "should destroy Moa" do
    visit moa_url(@moa)
    click_on "Destroy this moa", match: :first

    assert_text "Moa was successfully destroyed"
  end
end

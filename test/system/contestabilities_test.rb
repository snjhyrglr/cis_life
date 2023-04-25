require "application_system_test_case"

class ContestabilitiesTest < ApplicationSystemTestCase
  setup do
    @contestability = contestabilities(:one)
  end

  test "visiting the index" do
    visit contestabilities_url
    assert_selector "h1", text: "Contestabilities"
  end

  test "should create contestability" do
    visit contestabilities_url
    click_on "New contestability"

    fill_in "Max age", with: @contestability.max_age
    fill_in "Member type", with: @contestability.member_type
    fill_in "Min age", with: @contestability.min_age
    fill_in "Period", with: @contestability.period
    fill_in "Period type", with: @contestability.period_type
    click_on "Create Contestability"

    assert_text "Contestability was successfully created"
    click_on "Back"
  end

  test "should update Contestability" do
    visit contestability_url(@contestability)
    click_on "Edit this contestability", match: :first

    fill_in "Max age", with: @contestability.max_age
    fill_in "Member type", with: @contestability.member_type
    fill_in "Min age", with: @contestability.min_age
    fill_in "Period", with: @contestability.period
    fill_in "Period type", with: @contestability.period_type
    click_on "Update Contestability"

    assert_text "Contestability was successfully updated"
    click_on "Back"
  end

  test "should destroy Contestability" do
    visit contestability_url(@contestability)
    click_on "Destroy this contestability", match: :first

    assert_text "Contestability was successfully destroyed"
  end
end

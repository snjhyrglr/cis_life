require "application_system_test_case"

class RateTablesTest < ApplicationSystemTestCase
  setup do
    @rate_table = rate_tables(:one)
  end

  test "visiting the index" do
    visit rate_tables_url
    assert_selector "h1", text: "Rate tables"
  end

  test "should create rate table" do
    visit rate_tables_url
    click_on "New rate table"

    fill_in "Count", with: @rate_table.count
    fill_in "Gyrt rate", with: @rate_table.gyrt_rate_id
    fill_in "Proposal", with: @rate_table.proposal_id
    fill_in "Qx", with: @rate_table.qx
    click_on "Create Rate table"

    assert_text "Rate table was successfully created"
    click_on "Back"
  end

  test "should update Rate table" do
    visit rate_table_url(@rate_table)
    click_on "Edit this rate table", match: :first

    fill_in "Count", with: @rate_table.count
    fill_in "Gyrt rate", with: @rate_table.gyrt_rate_id
    fill_in "Proposal", with: @rate_table.proposal_id
    fill_in "Qx", with: @rate_table.qx
    click_on "Update Rate table"

    assert_text "Rate table was successfully updated"
    click_on "Back"
  end

  test "should destroy Rate table" do
    visit rate_table_url(@rate_table)
    click_on "Destroy this rate table", match: :first

    assert_text "Rate table was successfully destroyed"
  end
end

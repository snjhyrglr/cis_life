require "application_system_test_case"

class OfficersTest < ApplicationSystemTestCase
  setup do
    @officer = officers(:one)
  end

  test "visiting the index" do
    visit officers_url
    assert_selector "h1", text: "Officers"
  end

  test "should create officer" do
    visit officers_url
    click_on "New officer"

    check "Active" if @officer.active
    fill_in "Birth day", with: @officer.birth_day
    fill_in "Designation", with: @officer.designation
    fill_in "First name", with: @officer.first_name
    fill_in "Last name", with: @officer.last_name
    fill_in "Middle name", with: @officer.middle_name
    fill_in "Suffx", with: @officer.suffx
    click_on "Create Officer"

    assert_text "Officer was successfully created"
    click_on "Back"
  end

  test "should update Officer" do
    visit officer_url(@officer)
    click_on "Edit this officer", match: :first

    check "Active" if @officer.active
    fill_in "Birth day", with: @officer.birth_day
    fill_in "Designation", with: @officer.designation
    fill_in "First name", with: @officer.first_name
    fill_in "Last name", with: @officer.last_name
    fill_in "Middle name", with: @officer.middle_name
    fill_in "Suffx", with: @officer.suffx
    click_on "Update Officer"

    assert_text "Officer was successfully updated"
    click_on "Back"
  end

  test "should destroy Officer" do
    visit officer_url(@officer)
    click_on "Destroy this officer", match: :first

    assert_text "Officer was successfully destroyed"
  end
end

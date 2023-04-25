require "application_system_test_case"

class InsuredTypesTest < ApplicationSystemTestCase
  setup do
    @insured_type = insured_types(:one)
  end

  test "visiting the index" do
    visit insured_types_url
    assert_selector "h1", text: "Insured types"
  end

  test "should create insured type" do
    visit insured_types_url
    click_on "New insured type"

    fill_in "Description", with: @insured_type.description
    fill_in "Name", with: @insured_type.name
    click_on "Create Insured type"

    assert_text "Insured type was successfully created"
    click_on "Back"
  end

  test "should update Insured type" do
    visit insured_type_url(@insured_type)
    click_on "Edit this insured type", match: :first

    fill_in "Description", with: @insured_type.description
    fill_in "Name", with: @insured_type.name
    click_on "Update Insured type"

    assert_text "Insured type was successfully updated"
    click_on "Back"
  end

  test "should destroy Insured type" do
    visit insured_type_url(@insured_type)
    click_on "Destroy this insured type", match: :first

    assert_text "Insured type was successfully destroyed"
  end
end

require "application_system_test_case"

class AnnivTypesTest < ApplicationSystemTestCase
  setup do
    @anniv_type = anniv_types(:one)
  end

  test "visiting the index" do
    visit anniv_types_url
    assert_selector "h1", text: "Anniv types"
  end

  test "should create anniv type" do
    visit anniv_types_url
    click_on "New anniv type"

    fill_in "Name", with: @anniv_type.name
    click_on "Create Anniv type"

    assert_text "Anniv type was successfully created"
    click_on "Back"
  end

  test "should update Anniv type" do
    visit anniv_type_url(@anniv_type)
    click_on "Edit this anniv type", match: :first

    fill_in "Name", with: @anniv_type.name
    click_on "Update Anniv type"

    assert_text "Anniv type was successfully updated"
    click_on "Back"
  end

  test "should destroy Anniv type" do
    visit anniv_type_url(@anniv_type)
    click_on "Destroy this anniv type", match: :first

    assert_text "Anniv type was successfully destroyed"
  end
end

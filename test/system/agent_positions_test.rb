require "application_system_test_case"

class AgentPositionsTest < ApplicationSystemTestCase
  setup do
    @agent_position = agent_positions(:one)
  end

  test "visiting the index" do
    visit agent_positions_url
    assert_selector "h1", text: "Agent positions"
  end

  test "should create agent position" do
    visit agent_positions_url
    click_on "New agent position"

    check "Active" if @agent_position.active
    fill_in "Name", with: @agent_position.name
    click_on "Create Agent position"

    assert_text "Agent position was successfully created"
    click_on "Back"
  end

  test "should update Agent position" do
    visit agent_position_url(@agent_position)
    click_on "Edit this agent position", match: :first

    check "Active" if @agent_position.active
    fill_in "Name", with: @agent_position.name
    click_on "Update Agent position"

    assert_text "Agent position was successfully updated"
    click_on "Back"
  end

  test "should destroy Agent position" do
    visit agent_position_url(@agent_position)
    click_on "Destroy this agent position", match: :first

    assert_text "Agent position was successfully destroyed"
  end
end

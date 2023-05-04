require "test_helper"

class AgentPositionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @agent_position = agent_positions(:one)
  end

  test "should get index" do
    get agent_positions_url
    assert_response :success
  end

  test "should get new" do
    get new_agent_position_url
    assert_response :success
  end

  test "should create agent_position" do
    assert_difference("AgentPosition.count") do
      post agent_positions_url, params: { agent_position: { active: @agent_position.active, name: @agent_position.name } }
    end

    assert_redirected_to agent_position_url(AgentPosition.last)
  end

  test "should show agent_position" do
    get agent_position_url(@agent_position)
    assert_response :success
  end

  test "should get edit" do
    get edit_agent_position_url(@agent_position)
    assert_response :success
  end

  test "should update agent_position" do
    patch agent_position_url(@agent_position), params: { agent_position: { active: @agent_position.active, name: @agent_position.name } }
    assert_redirected_to agent_position_url(@agent_position)
  end

  test "should destroy agent_position" do
    assert_difference("AgentPosition.count", -1) do
      delete agent_position_url(@agent_position)
    end

    assert_redirected_to agent_positions_url
  end
end

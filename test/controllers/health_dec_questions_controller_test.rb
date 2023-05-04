require "test_helper"

class HealthDecQuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @health_dec_question = health_dec_questions(:one)
  end

  test "should get index" do
    get health_dec_questions_url
    assert_response :success
  end

  test "should get new" do
    get new_health_dec_question_url
    assert_response :success
  end

  test "should create health_dec_question" do
    assert_difference("HealthDecQuestion.count") do
      post health_dec_questions_url, params: { health_dec_question: { question_1: @health_dec_question.question_1, question_2: @health_dec_question.question_2, question_3: @health_dec_question.question_3, question_3_desc: @health_dec_question.question_3_desc, question_4: @health_dec_question.question_4, question_4_desc: @health_dec_question.question_4_desc, question_5_a: @health_dec_question.question_5_a, question_5_a_desc: @health_dec_question.question_5_a_desc, question_5_b: @health_dec_question.question_5_b, question_5_b_desc: @health_dec_question.question_5_b_desc } }
    end

    assert_redirected_to health_dec_question_url(HealthDecQuestion.last)
  end

  test "should show health_dec_question" do
    get health_dec_question_url(@health_dec_question)
    assert_response :success
  end

  test "should get edit" do
    get edit_health_dec_question_url(@health_dec_question)
    assert_response :success
  end

  test "should update health_dec_question" do
    patch health_dec_question_url(@health_dec_question), params: { health_dec_question: { question_1: @health_dec_question.question_1, question_2: @health_dec_question.question_2, question_3: @health_dec_question.question_3, question_3_desc: @health_dec_question.question_3_desc, question_4: @health_dec_question.question_4, question_4_desc: @health_dec_question.question_4_desc, question_5_a: @health_dec_question.question_5_a, question_5_a_desc: @health_dec_question.question_5_a_desc, question_5_b: @health_dec_question.question_5_b, question_5_b_desc: @health_dec_question.question_5_b_desc } }
    assert_redirected_to health_dec_question_url(@health_dec_question)
  end

  test "should destroy health_dec_question" do
    assert_difference("HealthDecQuestion.count", -1) do
      delete health_dec_question_url(@health_dec_question)
    end

    assert_redirected_to health_dec_questions_url
  end
end

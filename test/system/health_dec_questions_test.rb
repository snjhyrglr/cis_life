require "application_system_test_case"

class HealthDecQuestionsTest < ApplicationSystemTestCase
  setup do
    @health_dec_question = health_dec_questions(:one)
  end

  test "visiting the index" do
    visit health_dec_questions_url
    assert_selector "h1", text: "Health dec questions"
  end

  test "should create health dec question" do
    visit health_dec_questions_url
    click_on "New health dec question"

    fill_in "Question 1", with: @health_dec_question.question_1
    fill_in "Question 2", with: @health_dec_question.question_2
    fill_in "Question 3", with: @health_dec_question.question_3
    fill_in "Question 3 desc", with: @health_dec_question.question_3_desc
    fill_in "Question 4", with: @health_dec_question.question_4
    fill_in "Question 4 desc", with: @health_dec_question.question_4_desc
    fill_in "Question 5 a", with: @health_dec_question.question_5_a
    fill_in "Question 5 a desc", with: @health_dec_question.question_5_a_desc
    fill_in "Question 5 b", with: @health_dec_question.question_5_b
    fill_in "Question 5 b desc", with: @health_dec_question.question_5_b_desc
    click_on "Create Health dec question"

    assert_text "Health dec question was successfully created"
    click_on "Back"
  end

  test "should update Health dec question" do
    visit health_dec_question_url(@health_dec_question)
    click_on "Edit this health dec question", match: :first

    fill_in "Question 1", with: @health_dec_question.question_1
    fill_in "Question 2", with: @health_dec_question.question_2
    fill_in "Question 3", with: @health_dec_question.question_3
    fill_in "Question 3 desc", with: @health_dec_question.question_3_desc
    fill_in "Question 4", with: @health_dec_question.question_4
    fill_in "Question 4 desc", with: @health_dec_question.question_4_desc
    fill_in "Question 5 a", with: @health_dec_question.question_5_a
    fill_in "Question 5 a desc", with: @health_dec_question.question_5_a_desc
    fill_in "Question 5 b", with: @health_dec_question.question_5_b
    fill_in "Question 5 b desc", with: @health_dec_question.question_5_b_desc
    click_on "Update Health dec question"

    assert_text "Health dec question was successfully updated"
    click_on "Back"
  end

  test "should destroy Health dec question" do
    visit health_dec_question_url(@health_dec_question)
    click_on "Destroy this health dec question", match: :first

    assert_text "Health dec question was successfully destroyed"
  end
end

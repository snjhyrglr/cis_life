require "application_system_test_case"

class BatchHealthDecsTest < ApplicationSystemTestCase
  setup do
    @batch_health_dec = batch_health_decs(:one)
  end

  test "visiting the index" do
    visit batch_health_decs_url
    assert_selector "h1", text: "Batch health decs"
  end

  test "should create batch health dec" do
    visit batch_health_decs_url
    click_on "New batch health dec"

    fill_in "Batch", with: @batch_health_dec.batch_id
    fill_in "Health dec question", with: @batch_health_dec.health_dec_question_id
    fill_in "Status", with: @batch_health_dec.status
    fill_in "Sub coverage", with: @batch_health_dec.sub_coverage
    fill_in "Sub prem", with: @batch_health_dec.sub_prem
    fill_in "Sub rate", with: @batch_health_dec.sub_rate
    click_on "Create Batch health dec"

    assert_text "Batch health dec was successfully created"
    click_on "Back"
  end

  test "should update Batch health dec" do
    visit batch_health_dec_url(@batch_health_dec)
    click_on "Edit this batch health dec", match: :first

    fill_in "Batch", with: @batch_health_dec.batch_id
    fill_in "Health dec question", with: @batch_health_dec.health_dec_question_id
    fill_in "Status", with: @batch_health_dec.status
    fill_in "Sub coverage", with: @batch_health_dec.sub_coverage
    fill_in "Sub prem", with: @batch_health_dec.sub_prem
    fill_in "Sub rate", with: @batch_health_dec.sub_rate
    click_on "Update Batch health dec"

    assert_text "Batch health dec was successfully updated"
    click_on "Back"
  end

  test "should destroy Batch health dec" do
    visit batch_health_dec_url(@batch_health_dec)
    click_on "Destroy this batch health dec", match: :first

    assert_text "Batch health dec was successfully destroyed"
  end
end

require "application_system_test_case"

class AnswersTest < ApplicationSystemTestCase
  setup do
    @answer = answers(:one)
  end

  test "visiting the index" do
    visit answers_url
    assert_selector "h1", text: "Answers"
  end

  test "should create answer" do
    visit answers_url
    click_on "New answer"

    fill_in "Name", with: @answer.name
    fill_in "Poll", with: @answer.poll_id
    fill_in "User ids", with: @answer.user_ids
    fill_in "Votes", with: @answer.votes
    click_on "Create Answer"

    assert_text "Answer was successfully created"
    click_on "Back"
  end

  test "should update Answer" do
    visit answer_url(@answer)
    click_on "Edit this answer", match: :first

    fill_in "Name", with: @answer.name
    fill_in "Poll", with: @answer.poll_id
    fill_in "User ids", with: @answer.user_ids
    fill_in "Votes", with: @answer.votes
    click_on "Update Answer"

    assert_text "Answer was successfully updated"
    click_on "Back"
  end

  test "should destroy Answer" do
    visit answer_url(@answer)
    click_on "Destroy this answer", match: :first

    assert_text "Answer was successfully destroyed"
  end
end

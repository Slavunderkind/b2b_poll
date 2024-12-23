require "test_helper"

class AnswersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @answer = answers(:one)
  end

  test "should get index" do
    get answers_url
    assert_response :success
  end

  test "should get new" do
    get new_answer_url
    assert_response :success
  end

  test "should create answer" do
    assert_difference("Answer.count") do
      post answers_url, params: { answer: { name: @answer.name, poll_id: @answer.poll_id, user_ids: @answer.user_ids, votes: @answer.votes } }
    end

    assert_redirected_to answer_url(Answer.last)
  end

  test "should show answer" do
    get answer_url(@answer)
    assert_response :success
  end

  test "should get edit" do
    get edit_answer_url(@answer)
    assert_response :success
  end

  test "should update answer" do
    patch answer_url(@answer), params: { answer: { name: @answer.name, poll_id: @answer.poll_id, user_ids: @answer.user_ids, votes: @answer.votes } }
    assert_redirected_to answer_url(@answer)
  end

  test "should destroy answer" do
    assert_difference("Answer.count", -1) do
      delete answer_url(@answer)
    end

    assert_redirected_to answers_url
  end
end

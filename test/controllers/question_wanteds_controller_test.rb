require 'test_helper'

class QuestionWantedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @question_wanted = question_wanteds(:one)
  end

  test "should get index" do
    get question_wanteds_url
    assert_response :success
  end

  test "should get new" do
    get new_question_wanted_url
    assert_response :success
  end

  test "should create question_wanted" do
    assert_difference('QuestionWanted.count') do
      post question_wanteds_url, params: { question_wanted: { big_category: @question_wanted.big_category, comment: @question_wanted.comment, content: @question_wanted.content, small_category: @question_wanted.small_category, state: @question_wanted.state, stock: @question_wanted.stock, title: @question_wanted.title, user_id: @question_wanted.user_id } }
    end

    assert_redirected_to question_wanted_url(QuestionWanted.last)
  end

  test "should show question_wanted" do
    get question_wanted_url(@question_wanted)
    assert_response :success
  end

  test "should get edit" do
    get edit_question_wanted_url(@question_wanted)
    assert_response :success
  end

  test "should update question_wanted" do
    patch question_wanted_url(@question_wanted), params: { question_wanted: { big_category: @question_wanted.big_category, comment: @question_wanted.comment, content: @question_wanted.content, small_category: @question_wanted.small_category, state: @question_wanted.state, stock: @question_wanted.stock, title: @question_wanted.title, user_id: @question_wanted.user_id } }
    assert_redirected_to question_wanted_url(@question_wanted)
  end

  test "should destroy question_wanted" do
    assert_difference('QuestionWanted.count', -1) do
      delete question_wanted_url(@question_wanted)
    end

    assert_redirected_to question_wanteds_url
  end
end

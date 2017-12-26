require 'test_helper'

class CompetitionResultsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @competition_result = competition_results(:one)
  end

  test "should get index" do
    get competition_results_url
    assert_response :success
  end

  test "should get new" do
    get new_competition_result_url
    assert_response :success
  end

  test "should create competition_result" do
    assert_difference('CompetitionResult.count') do
      post competition_results_url, params: { competition_result: { avatar: @competition_result.avatar, avatar_cache: @competition_result.avatar_cache, calctime: @competition_result.calctime, competition_name: @competition_result.competition_name, content: @competition_result.content, day: @competition_result.day, distance: @competition_result.distance, hour: @competition_result.hour, minute: @competition_result.minute, point: @competition_result.point, prefecture_code: @competition_result.prefecture_code, second: @competition_result.second, user_id: @competition_result.user_id } }
    end

    assert_redirected_to competition_result_url(CompetitionResult.last)
  end

  test "should show competition_result" do
    get competition_result_url(@competition_result)
    assert_response :success
  end

  test "should get edit" do
    get edit_competition_result_url(@competition_result)
    assert_response :success
  end

  test "should update competition_result" do
    patch competition_result_url(@competition_result), params: { competition_result: { avatar: @competition_result.avatar, avatar_cache: @competition_result.avatar_cache, calctime: @competition_result.calctime, competition_name: @competition_result.competition_name, content: @competition_result.content, day: @competition_result.day, distance: @competition_result.distance, hour: @competition_result.hour, minute: @competition_result.minute, point: @competition_result.point, prefecture_code: @competition_result.prefecture_code, second: @competition_result.second, user_id: @competition_result.user_id } }
    assert_redirected_to competition_result_url(@competition_result)
  end

  test "should destroy competition_result" do
    assert_difference('CompetitionResult.count', -1) do
      delete competition_result_url(@competition_result)
    end

    assert_redirected_to competition_results_url
  end
end

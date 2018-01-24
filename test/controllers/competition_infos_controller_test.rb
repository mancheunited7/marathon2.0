require 'test_helper'

class CompetitionInfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @competition_info = competition_infos(:one)
  end

  test "should get index" do
    get competition_infos_url
    assert_response :success
  end

  test "should get new" do
    get new_competition_info_url
    assert_response :success
  end

  test "should create competition_info" do
    assert_difference('CompetitionInfo.count') do
      post competition_infos_url, params: { competition_info: {  } }
    end

    assert_redirected_to competition_info_url(CompetitionInfo.last)
  end

  test "should show competition_info" do
    get competition_info_url(@competition_info)
    assert_response :success
  end

  test "should get edit" do
    get edit_competition_info_url(@competition_info)
    assert_response :success
  end

  test "should update competition_info" do
    patch competition_info_url(@competition_info), params: { competition_info: {  } }
    assert_redirected_to competition_info_url(@competition_info)
  end

  test "should destroy competition_info" do
    assert_difference('CompetitionInfo.count', -1) do
      delete competition_info_url(@competition_info)
    end

    assert_redirected_to competition_infos_url
  end
end

require 'test_helper'

class RunFriendsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @run_friend = run_friends(:one)
  end

  test "should get index" do
    get run_friends_url
    assert_response :success
  end

  test "should get new" do
    get new_run_friend_url
    assert_response :success
  end

  test "should create run_friend" do
    assert_difference('RunFriend.count') do
      post run_friends_url, params: { run_friend: {  } }
    end

    assert_redirected_to run_friend_url(RunFriend.last)
  end

  test "should show run_friend" do
    get run_friend_url(@run_friend)
    assert_response :success
  end

  test "should get edit" do
    get edit_run_friend_url(@run_friend)
    assert_response :success
  end

  test "should update run_friend" do
    patch run_friend_url(@run_friend), params: { run_friend: {  } }
    assert_redirected_to run_friend_url(@run_friend)
  end

  test "should destroy run_friend" do
    assert_difference('RunFriend.count', -1) do
      delete run_friend_url(@run_friend)
    end

    assert_redirected_to run_friends_url
  end
end

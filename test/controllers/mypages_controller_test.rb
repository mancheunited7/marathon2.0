require 'test_helper'

class MypagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mypage = mypages(:one)
  end

  test "should get index" do
    get mypages_url
    assert_response :success
  end

  test "should get new" do
    get new_mypage_url
    assert_response :success
  end

  test "should create mypage" do
    assert_difference('Mypage.count') do
      post mypages_url, params: { mypage: {  } }
    end

    assert_redirected_to mypage_url(Mypage.last)
  end

  test "should show mypage" do
    get mypage_url(@mypage)
    assert_response :success
  end

  test "should get edit" do
    get edit_mypage_url(@mypage)
    assert_response :success
  end

  test "should update mypage" do
    patch mypage_url(@mypage), params: { mypage: {  } }
    assert_redirected_to mypage_url(@mypage)
  end

  test "should destroy mypage" do
    assert_difference('Mypage.count', -1) do
      delete mypage_url(@mypage)
    end

    assert_redirected_to mypages_url
  end
end

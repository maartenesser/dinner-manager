require 'test_helper'

class DinnersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get dinners_new_url
    assert_response :success
  end

  test "should get show" do
    get dinners_show_url
    assert_response :success
  end

  test "should get index" do
    get dinners_index_url
    assert_response :success
  end

end

require 'test_helper'

class DatePurchasesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get date_purchases_index_url
    assert_response :success
  end

  test "should get show" do
    get date_purchases_show_url
    assert_response :success
  end

  test "should get new" do
    get date_purchases_new_url
    assert_response :success
  end

  test "should get edit" do
    get date_purchases_edit_url
    assert_response :success
  end

end

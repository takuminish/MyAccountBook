require 'test_helper'

class ProductCategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get product_categories_new_url
    assert_response :success
  end

end

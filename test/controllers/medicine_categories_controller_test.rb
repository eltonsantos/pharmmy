require "test_helper"

class MedicineCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @medicine_category = medicine_categories(:one)
  end

  test "should get index" do
    get medicine_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_medicine_category_url
    assert_response :success
  end

  test "should create medicine_category" do
    assert_difference('MedicineCategory.count') do
      post medicine_categories_url, params: { medicine_category: { category_id: @medicine_category.category_id, medicine_id: @medicine_category.medicine_id } }
    end

    assert_redirected_to medicine_category_url(MedicineCategory.last)
  end

  test "should show medicine_category" do
    get medicine_category_url(@medicine_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_medicine_category_url(@medicine_category)
    assert_response :success
  end

  test "should update medicine_category" do
    patch medicine_category_url(@medicine_category), params: { medicine_category: { category_id: @medicine_category.category_id, medicine_id: @medicine_category.medicine_id } }
    assert_redirected_to medicine_category_url(@medicine_category)
  end

  test "should destroy medicine_category" do
    assert_difference('MedicineCategory.count', -1) do
      delete medicine_category_url(@medicine_category)
    end

    assert_redirected_to medicine_categories_url
  end
end

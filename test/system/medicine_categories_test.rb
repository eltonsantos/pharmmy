require "application_system_test_case"

class MedicineCategoriesTest < ApplicationSystemTestCase
  setup do
    @medicine_category = medicine_categories(:one)
  end

  test "visiting the index" do
    visit medicine_categories_url
    assert_selector "h1", text: "Medicine Categories"
  end

  test "creating a Medicine category" do
    visit medicine_categories_url
    click_on "New Medicine Category"

    fill_in "Category", with: @medicine_category.category_id
    fill_in "Medicine", with: @medicine_category.medicine_id
    click_on "Create Medicine category"

    assert_text "Medicine category was successfully created"
    click_on "Back"
  end

  test "updating a Medicine category" do
    visit medicine_categories_url
    click_on "Edit", match: :first

    fill_in "Category", with: @medicine_category.category_id
    fill_in "Medicine", with: @medicine_category.medicine_id
    click_on "Update Medicine category"

    assert_text "Medicine category was successfully updated"
    click_on "Back"
  end

  test "destroying a Medicine category" do
    visit medicine_categories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Medicine category was successfully destroyed"
  end
end

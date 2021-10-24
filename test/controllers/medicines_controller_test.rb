require "test_helper"

class MedicinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @medicine = medicines(:one)
  end

  test "should get index" do
    get medicines_url
    assert_response :success
  end

  test "should get new" do
    get new_medicine_url
    assert_response :success
  end

  test "should create medicine" do
    assert_difference('Medicine.count') do
      post medicines_url, params: { medicine: { medicine_insert: @medicine.medicine_insert, medicine_validity: @medicine.medicine_validity, name: @medicine.name, purchase_date: @medicine.purchase_date, quantity: @medicine.quantity, take_to: @medicine.take_to } }
    end

    assert_redirected_to medicine_url(Medicine.last)
  end

  test "should show medicine" do
    get medicine_url(@medicine)
    assert_response :success
  end

  test "should get edit" do
    get edit_medicine_url(@medicine)
    assert_response :success
  end

  test "should update medicine" do
    patch medicine_url(@medicine), params: { medicine: { medicine_insert: @medicine.medicine_insert, medicine_validity: @medicine.medicine_validity, name: @medicine.name, purchase_date: @medicine.purchase_date, quantity: @medicine.quantity, take_to: @medicine.take_to } }
    assert_redirected_to medicine_url(@medicine)
  end

  test "should destroy medicine" do
    assert_difference('Medicine.count', -1) do
      delete medicine_url(@medicine)
    end

    assert_redirected_to medicines_url
  end
end

require 'test_helper'

class SellersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @seller = sellers(:one)
  end

  test "should get index" do
    get sellers_url
    assert_response :success
  end

  test "should get new" do
    get new_seller_url
    assert_response :success
  end

  test "should create seller" do
    assert_difference('Seller.count') do
      post sellers_url, params: { seller: { first_name: @seller.first_name, last_name: @seller.last_name, org_id: @seller.org_id } }
    end

    assert_redirected_to seller_path(Seller.last)
  end

  test "should show seller" do
    get seller_url(@seller)
    assert_response :success
  end

  test "should get edit" do
    get edit_seller_url(@seller)
    assert_response :success
  end

  test "should update seller" do
    patch seller_url(@seller), params: { seller: { first_name: @seller.first_name, last_name: @seller.last_name, org_id: @seller.org_id } }
    assert_redirected_to seller_path(@seller)
  end

  test "should destroy seller" do
    assert_difference('Seller.count', -1) do
      delete seller_url(@seller)
    end

    assert_redirected_to sellers_path
  end
end

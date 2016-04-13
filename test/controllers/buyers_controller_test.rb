require 'test_helper'

class BuyersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @buyer = buyers(:one)
  end

  test "should get index" do
    get buyers_url
    assert_response :success
  end

  test "should get new" do
    get new_buyer_url
    assert_response :success
  end

  test "should create buyer" do
    assert_difference('Buyer.count') do
      post buyers_url, params: { buyer: { first_name: @buyer.first_name, last_name: @buyer.last_name, org_id: @buyer.org_id } }
    end

    assert_redirected_to buyer_path(Buyer.last)
  end

  test "should show buyer" do
    get buyer_url(@buyer)
    assert_response :success
  end

  test "should get edit" do
    get edit_buyer_url(@buyer)
    assert_response :success
  end

  test "should update buyer" do
    patch buyer_url(@buyer), params: { buyer: { first_name: @buyer.first_name, last_name: @buyer.last_name, org_id: @buyer.org_id } }
    assert_redirected_to buyer_path(@buyer)
  end

  test "should destroy buyer" do
    assert_difference('Buyer.count', -1) do
      delete buyer_url(@buyer)
    end

    assert_redirected_to buyers_path
  end
end

require 'test_helper'

class OrgsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @org = orgs(:one)
  end

  test "should get index" do
    get orgs_url
    assert_response :success
  end

  test "should get new" do
    get new_org_url
    assert_response :success
  end

  test "should create org" do
    assert_difference('Org.count') do
      post orgs_url, params: { org: { org_num: @org.org_num, title: @org.title } }
    end

    assert_redirected_to org_path(Org.last)
  end

  test "should show org" do
    get org_url(@org)
    assert_response :success
  end

  test "should get edit" do
    get edit_org_url(@org)
    assert_response :success
  end

  test "should update org" do
    patch org_url(@org), params: { org: { org_num: @org.org_num, title: @org.title } }
    assert_redirected_to org_path(@org)
  end

  test "should destroy org" do
    assert_difference('Org.count', -1) do
      delete org_url(@org)
    end

    assert_redirected_to orgs_path
  end
end

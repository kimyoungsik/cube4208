require 'test_helper'

class HeadOrganizationsControllerTest < ActionController::TestCase
  setup do
    @head_organization = head_organizations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:head_organizations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create head_organization" do
    assert_difference('HeadOrganization.count') do
      post :create, head_organization: @head_organization.attributes
    end

    assert_redirected_to head_organization_path(assigns(:head_organization))
  end

  test "should show head_organization" do
    get :show, id: @head_organization
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @head_organization
    assert_response :success
  end

  test "should update head_organization" do
    put :update, id: @head_organization, head_organization: @head_organization.attributes
    assert_redirected_to head_organization_path(assigns(:head_organization))
  end

  test "should destroy head_organization" do
    assert_difference('HeadOrganization.count', -1) do
      delete :destroy, id: @head_organization
    end

    assert_redirected_to head_organizations_path
  end
end

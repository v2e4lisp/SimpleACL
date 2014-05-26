require 'test_helper'

class SimpleACLTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, SimpleACL
  end

  test "have users controller" do
    assert_kind_of Class, UsersController
  end

  test "have method access_denied" do
    assert_respond_to ApplicationController.new, :access_denied
  end
end

class UsersControllerTest < ActionController::TestCase
  test "get index" do
    get :index
    assert_response :forbidden
  end
end

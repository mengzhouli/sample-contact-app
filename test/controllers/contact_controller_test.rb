require 'test_helper'

class ContactControllerTest < ActionDispatch::IntegrationTest
  test "view all contacts" do
    login_as users(:john)
    get contact_index_path
    assert_response :success
    assert_match "Jane", @response.body
    assert_match "James", @response.body
  end

  test "search by first name" do
    login_as users(:john)
    get contact_index_path, params: {"search"=>{"search"=>"jane"}}
    assert_response :success
    assert_match "Jane", @response.body
    assert_no_match "James", @response.body
  end

  test "search by tag" do
    login_as users(:john)
    get contact_index_path, params: {"search"=>{"search"=>"client"}}
    assert_response :success
    assert_match "Jane", @response.body
    assert_no_match "James", @response.body
  end
end

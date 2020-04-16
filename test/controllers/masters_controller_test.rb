require 'test_helper'

class MastersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get masters_index_url
    assert_response :success
  end

end

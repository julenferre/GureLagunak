require 'test_helper'

class GulagControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get gulag_index_url
    assert_response :success
  end

end

require 'test_helper'

class VoteImgsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get vote_imgs_new_url
    assert_response :success
  end

end

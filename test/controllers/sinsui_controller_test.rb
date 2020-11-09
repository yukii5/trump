require 'test_helper'

class SinsuiControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sinsui_index_url
    assert_response :success
  end

end

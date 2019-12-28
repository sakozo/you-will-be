require 'test_helper'

class TimesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get times_index_url
    assert_response :success
  end

end

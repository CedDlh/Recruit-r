require 'test_helper'

class PositionsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    post positions_create_url
    assert_response :success
    #body = JSON.parse(response.body)
    assert Position.last.name == "Cedric"

  end

end

require 'test_helper'

class PositionsControllerTest < ActionDispatch::IntegrationTest
  test "should create valid position with name and skills " do
    post positions_create_url, params: { position: {name: "Cedric", skill: "Javascript, Ajax" }}
    assert_response :success
    assert_equal "Cedric", Position.last.name
    assert_equal  "Javascript, Ajax", Position.last.skill

  end

end

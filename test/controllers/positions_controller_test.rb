require 'test_helper'

class PositionsControllerTest < ActionDispatch::IntegrationTest
  test "should call a list of all existing position" do
    test_position = Position.create(name: "Engineer", skill: "Javascript")
    test_position.save
    test_position2 = Position.create(name: "JS master", skill: "Javascript")
    test_position2.save
    test_positions =  Position.all
    get positions_url
    assert_response :success
    assert_equal test_positions, Position.all
  end

  test "should call a single existing position" do
    test_position3 = Position.create(name: "JS lover", skill: "Javascript")
    test_position3.save
    assert_equal test_position3.id, Position.last.id
  end


  test "should create valid position with name and skills " do
    post positions_url, params: { position: {name: "Cedric", skill: "Javascript, Ajax" }}
    assert_response :success
    assert_equal "Cedric", Position.last.name
    assert_equal  "Javascript, Ajax", Position.last.skill

  end

end

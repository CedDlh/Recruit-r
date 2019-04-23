require 'test_helper'

class ApplicantsControllerTest < ActionDispatch::IntegrationTest
  test "should create valid applicant with First Name, Last Name, email and Position ID " do
    test_position = Position.create(name: "Engineer", skill: "Javascript")
    test_position.save

    post applicants_create_url, params: { applicant: {first_name: "Cedric",
                                          last_name: "Dlh", email:"cedricdlh@gmail.com", position_id: test_position.id }}

    assert_response :success
    assert_equal "Cedric", Applicant.last.first_name
    assert_equal "Dlh", Applicant.last.last_name
    assert_equal "cedricdlh@gmail.com", Applicant.last.email
    assert_equal test_position.id, Applicant.last.position_id
  end
end

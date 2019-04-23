require 'test_helper'

class ApplicantsControllerTest < ActionDispatch::IntegrationTest
  test "should create valid applicant with First Name, Last Name, email and Position ID " do
    test_position = Position.create(name: "Engineer", skill: "Javascript")
    test_position.save

    post applicants_url, params: { applicant: {first_name: "Cedric",
                                          last_name: "Dlh", email:"cedricdlh@gmail.com", position_id: test_position.id }}

    assert_response :success
    assert_equal "Cedric", Applicant.last.first_name
    assert_equal "Dlh", Applicant.last.last_name
    assert_equal "cedricdlh@gmail.com", Applicant.last.email
    assert_equal test_position.id, Applicant.last.position_id
  end

   test "should call a single existing applicant" do
    test_position = Position.create(name: "Engineer", skill: "Javascript")
    test_position.save
    test_applicant = Applicant.create(first_name: "Cedric",
                                          last_name: "Dlh", email:"cedricdlh@gmail.com", position_id: test_position.id)
    test_applicant.save
    assert_equal test_applicant.id, Applicant.last.id
  end

  test "should update the user" do
    test_recruiter = Recruiter.create(name:"Pablo", skills: "Ruby" )
    test_recruiter.save
    test_position = Position.create(name: "Engineer", skill: "Javascript")
    test_position.save
    test_applicant = Applicant.create(first_name: "Cedric",
                                          last_name: "Dlh", email:"cedricdlh@gmail.com", position_id: test_position.id)
    test_applicant.save
    test_Applicant = Applicant.update(recruiter_id: test_recruiter.id)
    test_applicant.save
    assert_equal test_recruiter.id, Applicant.last.recruiter_id
  end

end

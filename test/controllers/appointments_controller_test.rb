require 'test_helper'

class AppointmentsControllerTest < ActionDispatch::IntegrationTest
  test "should create an appointment" do

    test_position = Position.create(name: "Engineer", skill: "Javascript")
    test_position.save

    test_recruiter = Recruiter.create(name:"Pablo", skills: "Ruby" )
    test_recruiter.save

    test_applicant = Applicant.create(first_name: "Cedric",
                                          last_name: "Dlh", email:"cedricdlh@gmail.com", position_id:
                                          test_position.id, recruiter_id: test_recruiter.id)
    test_applicant.save



   post appointments_url params: { appointment: {date: "22/08/2019", time: "18:00", applicant_id: test_applicant.id,
                                        recruiter_id: test_recruiter.id }}
    assert_response :success
   #assert_equal "Thu, 22 Aug 2019", Appointment.last.to_s
   #assert_equal "18:00", Appointment.last.time
    assert_equal test_applicant.id, Appointment.last.applicant_id
    assert_equal test_recruiter.id, Appointment.last.recruiter_id



  end

end

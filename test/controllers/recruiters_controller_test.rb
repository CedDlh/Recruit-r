require 'test_helper'

class RecruitersControllerTest < ActionDispatch::IntegrationTest
  test "should call a list of all existing recruiters" do
    get recruiters_url
    assert_response :success
    test_recruiter = Recruiter.create(name: "Pablo", skills: "Javascript")
    test_recruiter.save
    test_recruiter1 = Recruiter.create(name: "Amigo", skills: "Javascript")
    test_recruiter1.save
    test_recruiter1.skills
    test_recruiter_all = Recruiter.all
    assert_equal test_recruiter_all , Recruiter.all
  end

end


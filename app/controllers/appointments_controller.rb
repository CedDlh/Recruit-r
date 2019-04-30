class AppointmentsController < ApplicationController


  def new
    @appointment = Appointment.new
    @applicant = Applicant.last
    @recruiter = Recruiter.find(@applicant.recruiter_id)
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @recruiter = Applicant.last.recruiter_id
    @applicant = Applicant.last.id
    @appointment.applicant_id = @applicant
    @appointment.recruiter_id = @recruiter
    @appointment.save!
    redirect_to redirect_path
  end

private

  def appointment_params
    params.require(:appointment).permit(:datetime, :applicant_id, :recruiter_id)
  end
end

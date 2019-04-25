class ApplicantsController < ApplicationController

  def show
    @applicant = Applicant.find(params[:id])
    @appointment = Appointment.new
    @recruiter = Recruiter.find(@applicant.recruiter_id)
  end

  def create
    @applicant = Applicant.new(applicant_params)
    @applicant.save!
  end

  def update
    @applicant = Applicant.find(params[:id])
    @applicant.update(applicant_params)
    @applicant.save
  end

private

  def applicant_params
    params.require(:applicant).permit(:first_name, :last_name, :email, :position_id, :reruiter_id)
  end
end

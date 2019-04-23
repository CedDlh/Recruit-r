class ApplicantsController < ApplicationController

  def create
    @applicant = Applicant.new(applicant_params)
    @applicant.save!
  end

private

  def applicant_params
    params.require(:applicant).permit(:first_name, :last_name, :email, :position_id)
  end
end

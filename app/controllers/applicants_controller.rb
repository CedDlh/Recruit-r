class ApplicantsController < ApplicationController

  def new
    @applicant = Applicant.new
  end


  def show
    @applicant = Applicant.find(params[:id])
    @appointment = Appointment.new
    position = Position.find(@applicant.position_id)
    position_skills = position.skill.split(",")
    all_recuiter = Recruiter.all
    @rec_matches = []
    all_recuiter.each do |recruiter|
      recruiter_skills = recruiter.skills.split(",")
      unless (recruiter_skills & position_skills).empty?
        @rec_matches << recruiter
      end
    end
    # Create rec_matches array of names
    @match_name = []
    @rec_matches.each do |match|
      @match_name << match.name
    end

    #@recruiter = Recruiter.find(@applicant.recruiter_id)
  end

  def create
    @applicant = Applicant.new(applicant_params)
    if @applicant.save!
      redirect_to applicant_path(@applicant)
    else
      redirect_to applicant_path

    end
  end

  def update
    @applicant = Applicant.find(params[:id])
    @applicant.update(applicant_params)
    @applicant.save
  end

private

  def applicant_params
    params.require(:applicant).permit(:first_name, :last_name, :email, :position_id)
  end
end

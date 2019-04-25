class AppointmentsController < ApplicationController


  def new
  @appointment = Appointment.new
  end

   def create
     @appointment = Appointment.new(appointment_params)

     # @applicant = Applicant.find(params[:applicant_id])
     # @recruiter = Recruiter.find(params[:id])
     # @appointment.applicant = @applicant
     # @appointment.recruiter = @recruiter
     @appointment.save!
  end

private

def appointment_params
    params.require(:appointment).permit(:date, :time, :applicant_id, :recruiter_id)
end

end

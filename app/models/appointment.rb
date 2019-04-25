class Appointment < ApplicationRecord
  belongs_to :recruiter
  belongs_to :applicant
end

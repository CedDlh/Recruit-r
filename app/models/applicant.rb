class Applicant < ApplicationRecord
  belongs_to :position
  #belongs_to :recruiter
  has_many :appointments
end

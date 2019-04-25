class Recruiter < ApplicationRecord
  has_many :applicants
  has_many :appointments
end

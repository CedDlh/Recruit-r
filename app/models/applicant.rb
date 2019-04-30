class Applicant < ApplicationRecord
  belongs_to :position
  has_many :appointments
end

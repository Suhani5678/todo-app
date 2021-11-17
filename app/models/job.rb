class Job < ApplicationRecord
  belongs_to :user, optional: true
  has_many :job_applications

  accepts_nested_attributes_for :job_applications
end


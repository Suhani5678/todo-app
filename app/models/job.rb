class Job < ApplicationRecord
  belongs_to :user, optional: true
  has_many :job_application
end


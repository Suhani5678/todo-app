class Job < ApplicationRecord
  belongs_to :user, optional: true
  has_many :job_applications

  accepts_nested_attributes_for :job_applications

  def new_job_application_email
    @job = job
    UserMailer.new_user(self).deliver
  end
end


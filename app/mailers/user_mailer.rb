class UserMailer < ApplicationMailer

  def new_job_application_email(job_id, user_id)
    @job = Job.find(job_id)
    @user = User.find(user_id)
    mail(to: @user.email, subject: 'Applpied for a job')
  end
end


class JobsController < ApplicationController

  def index
    @jobs = Job.all
    @job = Job.new
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)

    if @job.save!
      redirect_to @job
    else
      render :new
    end
  end
  
  def apply_for_job
    @job_application = JobApplication.new
    @job_application.user_id = current_user.id
    @job_application.job_id = params[:id]
    @job_application.save!
    redirect_to jobs_path, notice: "successfully applied to job"
    if @job_application.save
      UserMailer.new_job_application_email(params[:id], current_user.id).deliver_now
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])

    if @job.update(job_params)
      redirect_to @job
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy!

    redirect_to root_path
  end

  private

  def find_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:user_id, :title, :description, :qualification, :required_skills,
                                :number_of_position, :location, :employment_type,
                                :joining_time, :package, :experience_required)
  end
end

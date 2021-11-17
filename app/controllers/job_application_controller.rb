class JobApplicationController < ApplicationController
    
  def index
    @job_applications = JobApplication.all
    @job_application = JobApplication.new
  end

  def show
    @job_application = JobApplication.find(params[:id])
  end

  def new
    @job_application = JobApplication.new
  end

  def create  
    @job = Job.find(id)
    @job_application = JobApplication.new(@job)
    @job_application.update(user_id : current_user.id)
    if @job_application.save!
      redirect_to @job_application
    else
      render :new
    end
    end   
  end  
  
  def edit
    @job_application = JobApplication.find(params[:id])
  end

  def update
    @job_application = JobApplication.find(params[:id])
    
    if @job_application.update(job_application_params)
      redirect_to @job_application
    else
      render :edit
    end
  end

  def destroy
    @job_application = JobApplication.find(params[:id])
    @job_application.destroy!

    redirect_to root_path
  end

  private

  def find_job_application
    @job_application = JobApplication.find(params[:id])
  end

  def job_application_params
    params.require(:job_application).permit(:user_id, :job_id)
  end
end

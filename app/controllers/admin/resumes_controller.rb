class Admin::ResumesController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_admin

  layout 'admin'

  def index
    @job = Job.find(params[:job_id])
    @resumes = @job.resumes.order('created_at DESC')
  end

  def require_is_admin
    if !current_user.admin?
      flash[:alert] = '有句话不知道当讲不当讲，你想当管理员的门都没有！'
      redirect_to root_path
    end
  end
end

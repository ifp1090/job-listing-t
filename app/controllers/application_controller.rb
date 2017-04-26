class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception

  def require_is_admin
    if !current_user.admin?
      flash[:alert] = '有句话不知道当讲不当讲，你想当管理员的门都没有！'
      redirect_to jobs_path
    end
  end

  def require_is_super_admin
    if !current_user.super_admin?
      flash[:alert] = '越权了你知道吗？U ARE NOT SUPER管理员！'
      redirect_to jobs_path
    end
  end

  def require_is_not_admin
    if current_user.admin?
      flash[:alert] = '管理员也想践行概念？先把管理工作做好了再说！'
      redirect_to jobs_path
    end
  end

  def after_sign_in_path_for(resource)
    jobs_path
  end

  protected

  def configure_permitted_parameters
	  devise_parameter_sanitizer.permit(:sign_up) do |user_params|
	    user_params.permit(:email, :password, :password_confirmation, :is_admin)
	  end
	end
end

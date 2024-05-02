class ApplicationController < ActionController::Base

  helper_method :current_user, :user_signed_in?

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = "You don't have permission to access this page"
    redirect_to root_path
  end

  def current_user
    return nil unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  def user_signed_in?
    return current_user.present?
  end

end

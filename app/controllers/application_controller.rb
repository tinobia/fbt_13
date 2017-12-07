class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private

  def logged_in_user
    return if logged_in?
    flash[:danger] = t "controllers.users_controller.please_login"
    redirect_to login_url
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :show_category_tour
  before_action :current_user

  private

  def show_category_tour
    @cat_tours = CategoryTour.all
    return if @cat_tours.count > 0
  end

  def logged_in_user
    return if logged_in?
    flash[:danger] = t "controllers.users_controller.please_login"
    redirect_to login_url
  end

  def current_user
    if user_id = session[:user_id]
      @current_user ||= User.find_by id: user_id
    elsif user_id = cookies.signed[:user_id]
      user = User.find_by id: user_id
      if user && user.authenticated?(:remember, cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  def login_success
    log_in @user
    params[:session][:remember_me] == Settings.sessions.default_check ? remember(@user) : forget(@user)
    remember @user
    if @user.admin?
      redirect_to admins_root_url
    else
      redirect_to root_url
    end
  end
end

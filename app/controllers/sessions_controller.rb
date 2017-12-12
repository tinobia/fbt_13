class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by email: params[:session][:email].downcase
    if @user && @user.authenticate(params[:session][:password])
      login_success
    else
      login_fail
    end
  end

  def login_fail
    flash.now[:danger] = t "controllers.sessions_controller.invalid-signin"
    render :new
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end

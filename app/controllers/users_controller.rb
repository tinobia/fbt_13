class UsersController < ApplicationController
  before_action :find_user, only: %i(show destroy edit)
  before_action :logged_in_user, only: %i(show edit)
  before_action :correct_user, only: %i(edit)

  def index
    @users = User.user_sort.paginate(page: params[:page])
  end

  def show; end

  def new
    @user = User.new
  end

  def edit; end

  def update
    @user = User.find_by id: params[:id]
    if @user.update_attributes user_params
      flash[:success] = t "controllers.users_controller.success_update_user"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t "controllers.users_controller.deleted"
    else
      flash[:danger] = t "controllers.users_controller.failed_to_delete"
    end
    redirect_to users_url
  end

  def create; end

  private

  def user_params
    params.require(:user).permit :name_user, :email, :tel, :password,
      :password_confirmation, :gender, :address
  end

  def find_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t "controllers.users_controller.not_found_user"
    redirect_to root_path
  end

  def logged_in_user
    return if logged_in?
    flash[:danger] = t "controllers.users_controller.please_login"
    redirect_to login_url
  end

  def correct_user
    @user = User.find_by id: params[:id]
    return if current_user? @user
    redirect_to root_url
  end
end

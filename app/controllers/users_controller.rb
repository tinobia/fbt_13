class UsersController < ApplicationController
  before_action :find_user, only: %i(show destroy edit)
  before_action :logged_in_user, only: %i(show edit)
  before_action :correct_user, only: %i(edit)

  def index
    @users = User.all
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

  def create
    @user = User.new user_params
    if @user.save
      flash.now[:success] = t "controllers.users_controller.success"
      redirect_to @user
    else
      render :new
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t "controllers.users_controller.deleted"
    else
      flash[:danger] = t "controllers.users_controller.failed_to_delete"
    end
    redirect_to root_path
  end

  private

  def find_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t "controllers.users_controller.not_found_user"
    redirect_to root_path
  end

  def user_params
    params.require(:user).permit :name_user, :email, :tel, :password,
      :password_confirmation, :gender, :address
  end

  def correct_user
    @user = User.find_by id: params[:id]
    return if current_user? @user
    redirect_to root_url
  end
end

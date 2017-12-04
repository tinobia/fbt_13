class UsersController < ApplicationController
  before_action :find_user, only: %i(show destroy)

  def index
    @users = User.user_sort.paginate(page: params[:page])
  end

  def show; end

  def new
    @user = User.new
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
end

module Admins
  class UsersController < AdminsController
    before_action :find_user, only: %i(destroy)

    def index
      @users = User.all
    end

    def destroy
      if @user.destroy
        flash[:success] = t "controllers.users_controller.deleted"
      else
        flash[:danger] = t "controllers.users_controller.failed_to_delete"
      end
      redirect_to admins_users_path
    end

    private

    def find_user
      @user = User.find_by id: params[:id]
      return if @user
      flash[:danger] = t "controllers.users_controller.not_found_user"
      redirect_to admins_users_path
    end
  end
end

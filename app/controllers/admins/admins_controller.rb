module Admins
  class AdminsController < ApplicationController
    layout "admin"
    before_action :is_admin?

    def is_admin?
      return if current_user.admin?
      flash[:danger] = t "controllers.admins.admins_controller.not_allowed"
      redirect_to root_url
    end
  end
end

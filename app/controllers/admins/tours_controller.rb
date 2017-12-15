module Admins
  class ToursController < AdminsController
    before_action :find_tour, only: %i(destroy edit update)
    before_action :show_category, only: %i(new edit)

    def index
      @tours = Tour.all
    end

    def new
      @tour = Tour.new
    end

    def edit; end

    def show; end

    def update
      if @tour.update_attributes tour_params
        flash[:success] = t "controllers.admins.tours_controller.updated"
        redirect_to admins_tours_path
      else
        render :edit_admins_tour
      end
    end

    def destroy
      if @tour.destroy
        flash[:success] = t "controllers.admins.tours_controller.deleted"
      else
        flash[:danger] = t "controllers.admins.tours_controller.failed_to_delete"
      end
      redirect_to admins_tours_path
    end

    def create
      @tour = Tour.new tour_params
      if @tour.save
        flash.now[:success] = t "controllers.admins.tours_controller.success"
        redirect_to admins_tours_path
      else
        redirect_to admins_root_url
      end
    end

    private

    def find_tour
      @tour = Tour.find_by id: params[:id]
      return if @tour
      flash[:danger] = t "controllers.tours_controller.not_found_tour"
      redirect_to root_path
    end

    def show_category
      @category_tours = CategoryTour.all
    end

    def tour_params
      params.require(:tour).permit :name_tour, :content, :picture, :starttime, :endtime, :price, :category_tour_id
    end
  end
end

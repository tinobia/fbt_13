class ToursController < ApplicationController
  before_action :find_tour, only: %i(destroy edit update)

  def index
    @tours = Tour.all
  end

  def edit; end

  def update
    if @tour.update_attributes tour_params
      flash[:success] = t "controllers.tours_controller.updated"
      redirect_to tours_path
    else
      render :edit
    end
  end

  def destroy
    if @tour.destroy
      flash[:success] = t "controllers.tours_controller.deleted"
    else
      flash[:danger] = t "controllers.tours_controller.failed_to_delete"
    end
    redirect_to tours_path
  end

  private

  def find_tour
    @tour = Tour.find_by id: params[:id]
    return if @tour
    flash[:danger] = t "controllers.tours_controller.not_found_tour"
    redirect_to root_path
  end

  def tour_params
    params.require(:tour).permit :name_tour, :content, :picture, :starttime, :endtime, :price, :category_tour_id
  end
end

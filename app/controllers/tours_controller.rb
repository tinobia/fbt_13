class ToursController < ApplicationController
  before_action :find_tour, only: :show

  def index
    @tours = Tour.show_tour_is_open.paginate(page: params[:page], per_page: Settings.tours.per_page)
    return if @tours.any?
    flash.now[:danger] = t "controllers.tours_controller.no_tour"
  end

  def show
    @review = @tour.reviews.build
    @reviews = @tour.reviews.order_by_created_at.paginate(page: params[:page], per_page: Settings.tours.per_page)
  end

  def search
    @tours = Tour.search_all(params[:search], params[:p])
      .paginate(page: params[:page], per_page: Settings.tours.per_page)
    return if @tours.any?
    flash.now[:danger] = t "controllers.tours_controller.not_found_tour"
  end

  private

  def find_tour
    @tour = Tour.find_by id: params[:id]
    return if @tour
    flash[:danger] = t "controllers.users_controller.not_found_tour"
    redirect_to root_path
  end
end

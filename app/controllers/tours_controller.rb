class ToursController < ApplicationController
  def index
    @tours = Tour.show_tour.paginate(page: params[:page], per_page: Settings.tours.per_page)
    return if @tours.any?
    flash.now[:danger] = t "controllers.tours_controller.no_tour"
  end

  def search
    @tours = Tour.search_all(params[:search], params[:p])
      .paginate(page: params[:page], per_page: Settings.tours.per_page)
    return if @tours.any?
    flash.now[:danger] = t "controllers.tours_controller.not_found_tour"
  end
end

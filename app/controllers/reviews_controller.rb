class ReviewsController < ApplicationController
  def create
    @review = current_user.reviews.new review_params
    @tour = Tour.find_by id: params[:tour_id]
    unless @tour && @review.save && @review
      flash[:danger] = t "controllers.reviews_controller.not_success"
    end
    redirect_to tour_path @tour
  end

  def destroy; end

  private

  def review_params
    params.require(:review).permit :content, :tour_id
  end
end

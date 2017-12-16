class ReviewsController < ApplicationController
  before_action :logged_in_user
  before_action :find_review, only: :destroy
  before_action :find_tour, only: %i(create destroy)

  def create
    @review = current_user.reviews.build(review_params)
    unless @review.save && @review
      flash[:danger] = t "controllers.reviews_controller.not_success"
    end
    redirect_to tour_path @tour
  end

  def index
    @reviews = Review.show_review_yourself(current_user.id).order_by_updated_at.paginate(page: params[:page],
      per_page: Settings.tours.per_page)
  end

  def edit; end

  def update
    if @review.update_attributes review_params
      flash[:success] = t "controllers.reviews_controller.success_update_review"
      redirect_to user_reviews_url(current_user)
    else
      render :edit
    end
  end

  def destroy
    if @review.destroy
      flash[:success] = t "controllers.reviews_controller.deleted"
    else
      flash[:success] = t "controllers.reviews_controller.failed_to_delete"
    end
    redirect_to tour_path @tour
  end

  private

  def find_review

    @review = Review.find_by id: params[:id]
    return if @review
    flash[:danger] = t "controllers.reviews_controller.not_found"
    redirect_to root_path
  end

  def find_tour
    @tour = Tour.find_by id: params[:tour_id]
    return if @tour
    flash[:danger] = t "controllers.reviews_controller.not_found_tour"
    redirect_to root_path
  end

  def review_params
    params.require(:review).permit :user_id, :tour_id, :content
  end
end

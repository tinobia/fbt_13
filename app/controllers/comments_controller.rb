class CommentsController < ApplicationController
  before_action :find_review, only: %i(create destroy)
  before_action :find_comment, only: :destroy
  before_action :find_tour, only: %i(create destroy)

  def create
    @comment = current_user.comments.build(comment_params)
    unless @comment.save && @comment
      flash[:danger] = t "controllers.comments_controller.not_success"
    end
    redirect_to tour_path @tour
  end

  def destroy
    if @comment.destroy
      flash[:success] = t "controllers.comments_controller.deleted"
    else
      flash[:success] = t "controllers.comments_controller.failed_to_delete"
    end
    redirect_to tour_path @tour
  end

  private

  def find_review
    @review = Review.find_by id: params[:review_id]
    return if @review
    flash[:danger] = t "controllers.comments_controller.not_found_review"
    redirect_to root_path
  end

  def find_comment
    @comment = Comment.find_by id: params[:id]
    return if @comment
    flash[:danger] = t "controllers.comments_controller.not_found_comment"
    redirect_to root_path
  end

  def find_tour
    @tour = Tour.find_by id: params[:tour_id]
    return if @tour
    flash[:danger] = t "controllers.reviews_controller.not_found_tour"
    redirect_to root_path
  end

  def comment_params
    params.require(:comment).permit :content, :review_id
  end
end

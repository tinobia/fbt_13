class TourdetailsController < ApplicationController
  def new
    if @current_user.present?
      user_present
    else
      flash[:danger] = t "controllers.tourdetails_controller.please_sign_up"
      redirect_to signup_path
    end
  end

  def create
    @tourdetail = Tourdetail.new tour_detail_params
    if @tourdetail.save
      book_pass
    else
      book_fail
    end
  end

  def book_pass
    if add_numpass_success
      flash[:success] = t "controllers.tourdetails_controller.booking_success"
      redirect_to @tourdetail
    else
      flash[:warning] = t "controllers.tourdetails_controller.full"
      redirect_to new_tourdetail_path(id: @tourdetail.tour_id)
    end
  end

  def book_fail
    flash[:danger] = t "controllers.tourdetails_controller.booking_fail"
    redirect_to new_tourdetail_path(id: @tourdetail.tour_id)
  end

  def show
    find_tour_detail
    find_tour @tourdetail
  end

  private

  def tour_detail_params
    params.require(:tourdetail).permit(:user_id, :tour_id, :num_of_pass, :total_price)
  end

  def check_over_slot
    flash[:danger] = t "controllers.tourdetails_controller.over_slots"
    false
  end

  def check_smaller_maxnum
    @tour.update_attribute :num_of_pass, @num_of_pass
    true
  end

  def check_equal_maxnum
    @tour.update_attribute :is_open, false
    @tour.update_attribute :num_of_pass, @num_of_pass
    true
  end

  def user_present
    @tour = Tour.find_by id: params[:id]
    if @tour
      @tourdetail = Tourdetail.new
    else
      flash[:danger] = "controllers.tourdetails_controller.not_found_tour"
      redirect_to tours_path
    end
  end

  def find_tour tour_detail
    @tour = Tour.find_by id: tour_detail.tour_id
    return if @tour
    flash[:danger] = t "controllers.tourdetails_controller.not_found_tour"
    redirect_to root_path
  end

  def find_tour_detail
    @tourdetail = Tourdetail.find_by id: params[:id]
    return if @tourdetail
    flash[:danger] = t "controllers.tourdetails_controller.not_found_tourdetail"
    redirect_to root_path
  end

  def add_numpass_success
    find_tour @tourdetail
    @num_of_pass = (@tour.num_of_pass.to_i + @tourdetail.num_of_pass)
    check_status_slot
  end

  def check_status_slot
    if @num_of_pass > Settings.tourdetails.book_tour.maxnum
      check_over_slot
    elsif @num_of_pass < Settings.tourdetails.book_tour.maxnum
      check_smaller_maxnum
    else
      check_equal_maxnum
    end
  end

  def check_over_slot
    flash[:danger] = t "controllers.tourdetails_controller.over_slots"
    false
  end

  def check_smaller_maxnum
    @tour.update_attribute :num_of_pass, @num_of_pass
    true
  end

  def check_equal_maxnum
    @tour.update_columns is_open: false, num_of_pass: @num_of_pass
    true
  end
end

module TourdetailsHelper
  def check_time_booking_tour tourdetail
    tourdetail.created_at >= Settings.time_booked.day.days.ago
  end
end

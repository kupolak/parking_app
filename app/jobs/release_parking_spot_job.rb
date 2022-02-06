class ReleaseParkingSpotJob < ApplicationJob
  queue_as :default


  def perform(*args)
    Booking.where('pickup_time >= :one_day_ago', one_day_ago: Time.now - 1.day).destroy_all
  end
end

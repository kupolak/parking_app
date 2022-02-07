class ReleaseParkingSpotJob < ApplicationJob
  queue_as :default

  def perform(*args)
    bookings = Booking.where("pickup_time >= :one_day_ago", one_day_ago: Time.now + 1.day)
    bookings.each do |b|
      b.spot.set_default_status
    end
  end
end

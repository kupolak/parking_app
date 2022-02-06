class BookingCommand < Slackathon::Command
  def call
    # Check available spots
    spots = Spot.where(status: "Available")
    if spots.empty?
      {
        response_type: "in_channel",
        text: "No more parking spots available. Try again later."
      }
    else
      available_spot = spots.sample
      # make a new booking
      booking = Booking.new(
        pickup_time: Time.now,
        return_time: Time.now + 1.day,
        spot_id: available_spot.id,
        # user_id: params[:user_id].to_i,
        user_id: 3
      )
      available_spot.status = "Reserved"
      available_spot.save!
      booking.save!
      {
        response_type: "in_channel",
        text: "Booked parking spot with number #{booking.spot_id}. Parking spots left: #{spots.count}"
      }
    end
  end
end

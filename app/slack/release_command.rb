class ReleaseCommand < Slackathon::Command
  def call
    # Check user bookings
    # bookings = Booking.where(user_id: current_user)
    bookings = Booking.where(user_id: 3)
    if bookings.empty?
      {
        response_type: "in_channel",
        text: "The user has no reserved parking spots."
      }
    else
      available_booking = bookings.sample
      # releasing a spot
      available_spot = spots.sample
      # make a new booking
      booking = Booking.new(
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

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
      # make a new booking
      {
        response_type: "in_channel",
        text: "Booked parking spot with number #{booking.spot_id}. Parking spots left: #{spots.count}"
      }
    end
  end
end

class BookingCommand < Slackathon::Command
  def call
    # Check available spots
    spots = Spot.where(status: "Available")
    if spots.nil?
      {
        response_type: "in_channel",
        text: "No more parking spots available. Try again later."
      }
    else
      available_spot = spots.sample
      spot = available_spot
      # make a new booking
      user_id = params[:user_id]
      booking = Booking.new(
        spot_id: spot.id,
        user_id: User.where(member_id: user_id).ids.join.to_i
      )
      booking.save!
      booking.spot.update(status: "Reserved")
      {
        response_type: "in_channel",
        text: "Booked parking spot with number #{booking.spot.id}. Parking spots left: #{spots.count}"
      }
    end
  end
end

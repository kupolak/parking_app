class BookingByIdCommand < Slackathon::Command
  def call
    # Check if spot is available
    spot = Spot.where(id: params[:text])
    if spot.status == "Reserved"
      {
        response_type: "in_channel",
        text: "The spot with number #{spot.id} is not available at the moment. Try to book a different spot."
      }
    else
      available_spot = spot
      # make a new booking
      booking = Booking.new(
        pickup_time: Time.now,
        return_time: Time.now + 1.day,
        spot_id: available_spot.id,
        user_id: params[:user_id]
        # user_id: 3
      )
      available_spot.status = "Reserved"
      available_spot.save!
      booking.save!
      {
        response_type: "in_channel",
        text: "Booked parking spot with number #{booking.spot_id}."
      }
    end
  end
end

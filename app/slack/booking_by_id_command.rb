class BookingByIdCommand < Slackathon::Command
  def call
    # Check if spot is available
    spot = Spot.where(id: (params[:text]).to_i).first
    if spot.status == "Reserved"
      {
        response_type: "in_channel",
        text: "The spot with number #{spot.id} is not available at the moment. Try to book a different spot."
      }
    else
      available_spot = spot
      # make a new booking
      user_id = params[:user_id]
      booking = Booking.new(
        spot_id: available_spot.id,
        user_id: User.where(member_id: user_id).ids.join.to_i
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

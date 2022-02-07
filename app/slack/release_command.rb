class ReleaseCommand < Slackathon::Command
  def call
    # Check user bookings
    # bookings = Booking.where(user_id: current_user)
    user_id = params[:user_id]
    bookings = Booking.where(user_id: User.where(member_id: user_id).ids.join.to_i)
    if bookings.empty?
      {
        response_type: "in_channel",
        text: "The user has no reserved parking spots."
      }
    else
      available_booking = bookings.sample
      # releasing a spot
      available_spot = available_booking
      # make a new booking

      booking = Booking.update(
        spot_id: available_spot.id,
        user_id: User.where(member_id: user_id).ids.join.to_i
      )
      available_spot.status = "Available"
      available_spot.save!
      booking.save!
      {
        response_type: "in_channel",
        text: "Booked parking spot with number #{booking.spot_id}. Parking spots left: #{spots.count}"
      }
    end
  end
end

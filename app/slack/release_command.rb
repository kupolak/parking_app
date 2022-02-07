class ReleaseCommand < Slackathon::Command
  def call
    # Check user bookings
    user_id = params[:user_id]
    bookings = Booking.where(user_id: User.where(member_id: user_id).ids.join.to_i)
    if bookings.empty?
      {
        response_type: "in_channel",
        text: "The user has no reserved parking spots."
      }
    else
      # releasing a spot
      random_spot = Spot.all.sample
      # update existing booking
      Booking.update!(
        spot_id: random_spot.id,
        user_id: User.where(member_id: user_id).ids.join.to_i
      )
      random_spot.spot.status = "Available"
      random_spot.save!
      available_spots = Spot.where(status: "Available")
      {
        response_type: "in_channel",
        text: "Released parking spot with number #{random_spot.spot_id}. Parking spots left: #{available_spots.count}"
      }
    end
  end
end

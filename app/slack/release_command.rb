class ReleaseCommand < Slackathon::Command
  def call
    # Check user bookings
    user_id = params[:user_id]
    bookings = Booking.where(user_id: User.where(member_id: user_id).ids.join.to_i)
    if bookings.nil?
      {
        response_type: "in_channel",
        text: "The user has no reserved parking spots."
      }
    else
      # releasing a spot
      all_spots = Spot.where(status: "Reserved")
      if all_spots.nil?
        {
          response_type: "in_channel",
          text: "All spots are available."
        }
      end
      spot = all_spots.sample
      if spot.nil?
        {
          response_type: "in_channel",
          text: "Random spot is available. Try to roll again."
        }
      end

      random_spot = spot

      # update existing booking
      booking = Booking.where(
        spot_id: random_spot.id,
        user_id: User.where(member_id: user_id).ids.join.to_i
      ).first
      random_spot.update!(status: "Available")
      booking.save!

      available_spots = Spot.where(status: "Available")
      {
        response_type: "in_channel",
        text: "Released parking spot with number #{random_spot.id}. Parking spots left: #{available_spots.count}"
      }
    end
  end
end

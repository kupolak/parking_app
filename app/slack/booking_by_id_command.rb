class BookingByIdCommand < Slackathon::Command
  def call
    # Check available spots
    spots = Spot.where(status: "Available")
    if spots.nil?
      {
        response_type: "in_channel",
        text: "No more parking spots available. Try again later."
      }
    end
    # Check if spot is available
    spots = Spot.where(id: params[:text].to_i).first
    if spots.status == "Reserved"
      {
        response_type: "in_channel",
        text: "The spot with number #{spots.id} is not available at the moment. Try to book a different spot."
      }
    else
      user_id = params[:user_id]
      booking = Booking.new(
        spot_id: params[:text].to_i,
        user_id: User.where(member_id: user_id).ids.join.to_i
      )
      booking.save!
      booking.spot.update!(status: "Reserved")
      {
        response_type: "in_channel",
        text: "Booked parking spot with number #{booking.spot.id}."
      }
    end
  end
end

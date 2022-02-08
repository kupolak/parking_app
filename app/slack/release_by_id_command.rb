class ReleaseByIdCommand < Slackathon::Command
  def call
    # Check if a spot is available
    spoti = Spot.where(id: params[:text].to_i).first
    if spoti.status == "Available"
      {
        response_type: "in_channel",
        text: "The spot with number #{spoti.id} is available. Try to release a different spot."
      }
    else
      # update existing booking
      user_id = params[:user_id]
      booking = Booking.where(
        spot_id: spoti.id,
        user_id: User.where(member_id: user_id).ids.join.to_i
      ).first
      booking.save!
      booking.spot.update(status: "Available")
      booking.update(user: nil)
      {
        response_type: "in_channel",
        text: "Released parking spot with number #{spoti.id}."
      }
    end
  end
end

class ReleaseByIdCommand < Slackathon::Command
  def call
    # Check if a spot is available
    spot = Spot.where(id: (params[:text]).to_i).first
    if spot.status == "Available"
      {
        response_type: "in_channel",
        text: "The spot with number #{spot.id} is available. Try to release a different spot."
      }
    else
      # update existing booking
      user_id = params[:user_id]
      # booking = Booking.where
      Booking.update!(
        spot_id: spot.id,
        user_id: User.where(member_id: user_id).ids.join.to_i
      )
      spot.status = "Available"
      spot.save!
      {
        response_type: "in_channel",
        text: "Released parking spot with number #{params[:text]}."
      }
    end
  end
end

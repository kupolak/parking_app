class SpotStatusCommand < Slackathon::Command
  def call
    spot = Spot.where(id: params[:text])
    if spot.empty?
      {
        response_type: "in_channel",
        text: "The parking spot with id #{params[:text]} doesn't exist."
      }
    else
      status = spot['status'].to_s
      {
        response_type: "in_channel",
        text: "The parking spot with id #{params[:text]} is #{status}"
      }
    end
  end
end

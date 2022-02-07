class SpotStatusCommand < Slackathon::Command
  def call
    p "dupa"
    spot = Spot.where(id: params[:text].to_s)
    if spot.empty?
      {
        response_type: "in_channel",
        text: "The parking spot with id #{params[:text]} doesn't exist."
      }
    else
      p spot.status
      # status = spot["status"].to_s
      # p status
      {
        response_type: "in_channel",
        text: "The parking spot with id #{params[:text].to_s} is #{spot[:status]}"
      }
    end
  end
end

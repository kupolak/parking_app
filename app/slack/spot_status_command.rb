class SpotStatusCommand < Slackathon::Command
  def call
    spot = Spot.where(id: params[:text].to_i).first
    if spot.nil?
      {
        response_type: "in_channel",
        text: "The parking spot with id #{params[:text]} doesn't exist."
      }
    else
      {
        response_type: "in_channel",
        text: "The parking spot with id #{params[:text]} is #{spot[:status]}. Booked by: #{params[:user_name]}"
      }
    end
  end
end

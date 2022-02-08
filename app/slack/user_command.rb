class UserCommand < Slackathon::Command
  def call
    {
      response_type: "in_channel",
      text: "Hello! Your name: #{params[:user_name]}, member_id: #{params[:user_id]}"
    }
  end
end

class UserCommand < Slackathon::Command
  def call
    {
      response_type: "in_channel",
      text: "hello #{params[:user_name]} #{params[:text]} #{params[:user_id]}"
    }
  end
end

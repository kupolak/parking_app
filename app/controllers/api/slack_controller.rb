require 'httparty'

module API
  module SlackController
    @base_url = "https://slack.com/api/"
    @client_id = "3057159455794.3054441345573"
    @client_secret = "f27c23ec1c066950d6fc02a4741ad31b"
    @redirect_uri= "https://localhost:3000/slack_sign_in/callback"

    def self.authorize
      request = HTTParty.get(@base_url + "v2/authorize", params: {
        scope: "incoming-webhook,commands",
        client_id: @client_id
      })
      p request
    end

    def self.authenticate
      request = HTTParty.get(@base_url + "oauth.v2.access", params: {
        client_id: @client_id,
        client_secret: @client_secret,
        redirect_uri: @redirect_uri
      })
      p request
    end

    def spot_status
      spot_status
    end

    def spot_booking

    end

    def spot_release

    end
  end
end

API::SlackController.authorize
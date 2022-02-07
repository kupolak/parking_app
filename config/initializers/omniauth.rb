Rails.application.config.middleware.use OmniAuth::Builder do
  provider :slack, SLACK_CLIENT_ID, SLACK_CLIENT_SECRET, scope: "team:read,users:read,identify,bot"
end

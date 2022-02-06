Rails.application.config.middleware.use OmniAuth::Builder do
  provider :slack, '3057159455794.3054441345573', 'f27c23ec1c066950d6fc02a4741ad31b', scope: 'team:read,users:read,identify,bot'
end

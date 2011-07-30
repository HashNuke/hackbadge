Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, 'CONSUMER_KEY', 'CONSUMER_SECRET'
end

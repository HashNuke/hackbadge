Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, 'aae16f679b73026bebed', '5b7ea251bcd861e86e16f445ce215856806727dc', {:scope => "repo"}
end

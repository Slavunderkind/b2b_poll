Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://redis:6379/0' } if ENV['DOCKERIZED']
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://redis:6379/0' } if ENV['DOCKERIZED']
end

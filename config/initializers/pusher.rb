
# Pusher.app_id = Rails.application.secrets.pusher_app_id
# Pusher.key = Rails.application.secrets.pusher_key
# Pusher.secret = Rails.application.secrets.pusher_secret	

require 'pusher'

Pusher.url = "http://#{Pusher.key}:#{Pusher.secret}@api.pusherapp.com/apps/#{Pusher.app_id}"
Pusher.logger = Rails.logger

Pusher.app_id = Rails.application.secrets.app_id
Pusher.key = Rails.application.secrets.pusher_key
Pusher.secret = Rails.application.secrets.pusher_secret
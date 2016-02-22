Rails.application.routes.draw do

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  root to: 'test#fire_event'

  resource :rooms, only: [:show]

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end

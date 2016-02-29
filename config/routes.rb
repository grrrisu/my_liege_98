Rails.application.routes.draw do

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  get 'test/fire_event', to: 'test#fire_event'

  resource :rooms, only: [:show]

  namespace :admin do
    resource :realms, only: [:show] do
      patch :start
      patch :stop
    end
  end

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end

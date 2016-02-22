class Message < ApplicationRecord
  after_create_commit { MessageBroadcastJob.perform_async id }
end

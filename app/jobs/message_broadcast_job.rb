class MessageBroadcastJob
  include Sidekiq::Worker

  def perform(id)
    message = Message.find(id)
    ActionCable.server.broadcast 'room_channel', message: render_message(message)
  end

private

  def render_message(message)
    ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
  end

end

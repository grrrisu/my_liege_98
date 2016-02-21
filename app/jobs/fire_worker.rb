class FireWorker
  include Sidekiq::Worker
  def perform(some_id)
    logger.info some_id
    #FireWorker.perform_async(123)
  end
end

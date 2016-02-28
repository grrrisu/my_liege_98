class SimWorkerJob
  include Sidekiq::Worker

  RETRY_TIMEOUT = 1.second

  def perform(id)
    @object = Sim::Object.find id
    lock_resources ? fire : retry_sim
  end

  def fire
    @object.update_attribute :status, Sim::Area.statuses[:performing]
    Sim::Object.transaction do
      @object.sim
      @object.update_attribute :status, Sim::Area.statuses[:idle]
    end
  end

  def retry_sim
    SimWorkerJob.perform_in RETRY_TIMEOUT, @object.id
  end

  def lock_resources
    true
  end

end

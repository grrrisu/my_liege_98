class SimLoopJob
  include Sidekiq::Worker

  BATCH_SIZE = 5
  LOOP_DURATION = 10.seconds

  def perform
    if Sim::Area.not_idle.count == 0
      Sim::Area.set_idle_to_pending
    end
    sim_next_objects
    reschedule
  end

  def reschedule
    if SimLoopService.new.running?
      SimLoopJob.perform_in(step * BATCH_SIZE)
    end
  end

  def sim_next_objects
    Sim::Area.pending.order(updated_at: :asc).limit(BATCH_SIZE).each_with_index do |area, index|
      area.update_attribute(:status, Sim::Area.statuses[:queued])
      SimWorkerJob.perform_in(index * step, area.id)
    end
  end

  def step
    LOOP_DURATION / Sim::Area.all.count
  end

end

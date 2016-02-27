class SimLoopJob
  include Sidekiq::Worker

  BATCH_SIZE = 5

  def perform
    if Sim::Area.not_idle.count == 0
      Sim::Area.set_idle_to_pending
    end
    sim_next_objects
    reschedule
  end

  def reschedule
    # TODO check if level is still running
    SimLoopJob.perform_in(5.seconds)
  end

  def sim_next_objects
    Sim::Area.pending.order(updated_at: :asc).limit(BATCH_SIZE).each_with_index do |area, index|
      #SimWorker.perfom_in(index * 1.seconds, area)
    end
  end

end

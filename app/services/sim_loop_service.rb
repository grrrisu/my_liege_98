class SimLoopService

  def initialize
    @redis = RedisService.connection
  end

  def start
    @redis.set('realm_running', true)
    resume_queued_sim_objects
    SimLoopJob.perform_async
  end

  def running?
    @redis.get('realm_running')
  end

  def stop
    @redis.del('realm_running')
  end

  def sidekiq_running?
    File.exist?(Rails.root.join('tmp', 'pids', 'sidekiq.pid'))
  end

  def start_sidekiq
    unless sidekiq_running?
      Dir.chdir(Rails.root) do
        pid = Process.spawn 'sidekiq', '-C', 'config/sidekiq.yml'
        Process.detach pid
      end
    end
  end

  private

  def resume_queued_sim_objects
    Rails.logger.info "resume #{Sim::Area.queued.count} queued areas"
    Sim::Area.queued.each do |area|
      SimWorkerJob.perform_async(area.id)
    end
    Rails.logger.info "resume #{Sim::Area.performing.count} performing areas"
    Sim::Area.performing.each do |area|
      SimWorkerJob.perform_async(area.id)
    end
  end

end

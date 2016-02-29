module Admin::RealmsHelper

  def realm_running?
    sim_loop_service.running?
  end

  def sidekiq_running?
    sim_loop_service.sidekiq_running?
  end

end

module Admin::RealmsHelper

  def realm_running?
    SimLoopService.new.running?
  end

end

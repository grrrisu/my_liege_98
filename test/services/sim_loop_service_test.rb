require 'test_helper'

class SimLoopServiceTest < ActiveSupport::TestCase

  def setup
    @service = SimLoopService.new
  end

  test "start sim loop" do
    assert_difference('SimLoopJob.jobs.size', 1) do
      queued_or_performing = Sim::Area.queued.or(Sim::Area.pending).count
      assert_difference('SimWorkerJob.jobs.size', queued_or_performing) do
        @service.start
      end
    end
    assert @service.running?
  end

  test "stop sim loop" do
    @service.start

    @service.stop
    assert_not @service.running?
  end

end

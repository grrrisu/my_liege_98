require 'test_helper'

class SimWorkerJobTest < ActiveJob::TestCase
  fixtures 'sim/areas'

  def setup
    @job = SimWorkerJob.new
  end

  test "peform sim and set back to status idle" do
    assert_difference('Sim::Area.idle.count', 1) do
      @job.perform sim_areas(:queued).id
    end
  end

end

require 'test_helper'

class SimLoopJobTest < ActiveJob::TestCase
  fixtures 'sim/areas'

  def setup
    @job = SimLoopJob.new
  end

  test "set all to pending" do
    Sim::Area.update_all(status: Sim::Area.statuses[:idle])
    idles = Sim::Area.idle.count

    assert_difference('Sim::Area.pending.count', idles) do
      @job.perform
    end
  end


end

class TestController < ApplicationController

  def fire_event
    FireWorker.perform_async(123)
  end

end

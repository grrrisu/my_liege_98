class Admin::RealmsController < ApplicationController

  def show
    @realm = Realm.first_or_create(name: 'Test')
  end

  def start
    SimLoopService.new.start
  end

  def stop
    SimLoopService.new.stop
  end

end

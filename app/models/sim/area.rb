module Sim
  class Area < Sim::Object

    has_many :fields, class_name: 'Sim::Field', foreign_key: 'parent_id', dependent: :destroy

    # idle: all done, waiting for next loop
    # pending: should be simulated again and be queued soon
    # queued: ready for SimWorker to be picked up
    # performing: simulation is running by SimWorker
    enum status: { idle: 0, pending: 1, queued: 2, performing: 3 }

    scope :not_idle, -> { where.not(status: statuses[:idle]) }

    def self.set_idle_to_pending
      idle.update_all(status: statuses[:pending])
    end

    # there will be only one job calling this sim method
    # all subdquent objects are simulated within this method
    def sim
      for_each_timeunit do
        sim_children
      end
    end

    def for_each_timeunit
      yield
    end

  end
end

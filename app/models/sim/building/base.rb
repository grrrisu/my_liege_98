module Sim
  module Building
    class Base < Sim::Object

      # supply_capacity: things needed for inhabitants, eg. food, tools
      # storage_capacity: things needed for production or things that have been produced
      # self_sustaining: rate how much food can be self organized, eg. garden, chickens, near environment
      properties :supply_capacity, :storage_capacity, :self_sustaining  # structure(constitution)

    end

  end
end

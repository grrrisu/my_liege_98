module Sim
  module Pawn
    class Lumberjack < Base

      PRODUCTION_RATE = 0.2 # how to deal with unfinished products
      BREAK_RATE = 0.1 # every 10th produced unit a tool breaks

      # delay: float in timeunits
      def sim delay
        request delay #tools and food
        produce delay
        transport delay
        consume delay
      end

      def produce delay
        production = delay * PRODUCTION_RATE
        broken_tools = BREAK_RATE * production
      end

    end
  end
end

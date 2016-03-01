module Sim
  class Thing < Sim::Object

    # amount: number of same things, min = 1
    # health: if 0 reached the thing is broken
    # quality: the better the less it gets broken
    properties :amount, :health #(vs amount) # quality

  end
end

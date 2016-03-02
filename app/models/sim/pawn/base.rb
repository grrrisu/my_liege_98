module Sim
  module Pawn
    class Base < Sim::Object

    STARVATION  = 100 # pawn dies if hunger reaches this limit
    FOOD_NEEDED = 10  # food need per round

    # self-sustaining: rate how much food can be self organized
    # hunger: 0 full-satisfied, > 0 hungry/starving, < 0 fat
    # skill/type: farmer, carpenter
    # dexterity: (the better the less it breaks tools, produces better quality products)
    properties :hunger # :health ?, # constitution

    end
  end
end

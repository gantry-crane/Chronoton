module Chronoton
  class Rule
    attr_accessor :from, :to, :capacity
    def initialize(from: nil, to: nil, capacity: nil)
      @from = from
      @to = to
      @capacity = capacity
    end

    def applies?(time)
      (from..to).include?(time)
    end
  end
end

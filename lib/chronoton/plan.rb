module Chronoton
  class Plan
    attr_reader :default, :rules

    def initialize(rules: [], default: 2)
      @rules = rules
      @default = default
    end

    def currently_desired_capacity(time)
      matching_rules = @rules.select { |rule| rule.applies?(time) }

      return default if matching_rules.empty?

      matching_rules.first.capacity
    end
  end
end

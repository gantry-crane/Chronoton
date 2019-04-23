RSpec.describe Chronoton::Plan do
  describe 'desired capacity' do
    let!(:plan) do
      Chronoton::Plan.new(rules: [
                            Chronoton::Rule.new(from: Time.new - 2 * 3600,
                                                to: Time.new + 2 * 3600,
                                                capacity: 5)
                          ],
                          default: 3)
    end
    it 'finds the correct desired capacity for a timeframe' do
      expect(plan.currently_desired_capacity(Time.new)).to eq(5)
    end

    it 'falls back to the default if no rule applies' do
      time = Time.new - 4 * 3600

      expect(plan.currently_desired_capacity(time)).to eq(3)
    end
  end
end

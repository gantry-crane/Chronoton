RSpec.describe Chronoton::ForemanNotifier do
  describe 'notify' do
    let(:url)do
      'http://localhost:3000/gantry_crane/api/v1/auto_scaling_groups/fdd987924e412fc23f5b65f81ae1f7322c5acd2f80b1946329a3fb624b8f9e594a588205b073056d3e39381e00f96a588c1cda7deaf0c492e257a94b5357f61d'
    end

    let!(:foreman_notifier) do
      Chronoton::ForemanNotifier.new(url)
    end

    it 'sends the desired capacity to the given url' do
      response = nil

      VCR.use_cassette('foreman_notifier') do
        response = foreman_notifier.notify(5)
      end

      expect(response['currently_desired_capacity']).to eq(5)
    end
  end
end

module Chronoton
  require 'httparty'
  class ForemanNotifier
    attr_reader :url

    def initialize(url)
      @url = url
    end

    def notify(desired_capacity)
      response = HTTParty.put(url,
                   body: {
                    currently_desired_capacity: desired_capacity,
                    reason: 'Timebased Scaling Rule'
                   }.to_json,
                   headers: {
                    'Content-Type' => 'application/json'
                   })
      JSON.parse(response.body)
    end
  end
end

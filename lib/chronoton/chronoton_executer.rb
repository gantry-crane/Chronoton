require 'logger'
require 'json'
module Chronoton
  class ChronotonExecuter
    def call(yaml_file_path, url)
      logger.debug("Reading yaml file #{yaml_file_path}")
      plan = PlanYamlFileReader.new(yaml_file_path).load!

      desired_capacity = plan.currently_desired_capacity(Time.new)
      logger.info("Desired Capacity for #{Time.new}: #{desired_capacity}")

      response = ForemanNotifier.new(url).notify(desired_capacity)

      logger.info("Foreman was notified: #{JSON.generate(response)}")
    end

    def logger
      @logger ||= Logger.new(STDOUT)
    end
  end
end

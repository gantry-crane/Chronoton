module Chronoton
  class ChronotonExecuter
    def call(yaml_file_path, url)
      plan = PlanYamlFileReader.new(yaml_file_path).load!
      desired_capacity = plan.currently_desired_capacity(Time.new)
      ForemanNotifier.new(url).notify(desired_capacity)
    end
  end
end

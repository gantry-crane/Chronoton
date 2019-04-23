module Chronoton
  require 'yaml'
  require 'time'
  class PlanYamlFileReader
    attr_reader :file_path
    def initialize(file_path)
      @file_path = file_path
    end

    def load!
      yaml = YAML.load(File.read(file_path))

      default = yaml['default']

      rules = yaml['rules'].map do |raw_rule|
        rule = Rule.new
        rule.from = parse_time(raw_rule['from'])
        rule.to = parse_time(raw_rule['to'])
        rule.capacity = raw_rule['capacity']
        rule
      end

      Plan.new(default: default, rules: rules)
    end

    private

    def parse_time(raw_time)
      Time.parse(Time.new.strftime('%d.%m.%Y') + ' ' + raw_time)
    end
  end

end

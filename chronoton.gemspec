
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "chronoton/version"

Gem::Specification.new do |spec|
  spec.name          = "chronoton"
  spec.version       = Chronoton::VERSION
  spec.authors       = ["Tim Kächele"]
  spec.email         = ["tim.kaechele@dm.de"]

  spec.summary       = 'Time based scaling cli for the gantry crane foreman plugin'
  spec.description   = 'Allows you to specify time based rules to scale server groups'
  spec.homepage      = "https://github.com/timkaechele/chronoton"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["homepage_uri"] = spec.homepage
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables  << 'chronoton'
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "vcr", "~> 4.0"
  spec.add_development_dependency "webmock", "~> 3.5"
  spec.add_dependency "httparty", "~> 0.17"
end

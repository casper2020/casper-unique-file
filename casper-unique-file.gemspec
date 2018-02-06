
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "casper/unique/file/version"

Gem::Specification.new do |spec|
  spec.name          = "casper-unique-file"
  spec.version       = Casper::Unique::File::VERSION
  spec.authors       = ["Eurico Inocencio"]
  spec.email         = ["eurico.inocencio@gmail.com"]

  spec.summary       = %q{Helper to make safe unique filename for ruby}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."

  # this tells RubyGems to build an extension upon install
  spec.extensions = %w[ext/casper_unique_file/extconf.rb]

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  #spec.files         = `git ls-files -z`.split("\x0").reject do |f|
  #  f.match(%r{^(ext|test|spec|features)/})
  #end
  spec.files = Dir.glob("ext/**/*") + Dir.glob("lib/**/*") + %w[
    README.md
    Rakefile
    casper-unique-file.gemspec
  ]

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency 'rake-compiler'

end

#
# Copyright (c) 2018 Cloudware S.A. All rights reserved.
#
# This file is part of casper-unique-file.
#
# casper-unique-file is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# casper-unique-file  is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with casper-unique-file.  If not, see <http://www.gnu.org/licenses/>.
#

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

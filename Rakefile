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
require 'bundler/gem_tasks'
require 'rake/extensiontask'

gemspec = Gem::Specification.load('casper_unique_file.gemspec')

Rake::ExtensionTask.new('casper_unique_file') do |ext|
  ext.name           = 'casper_unique_file'
  ext.source_pattern = "*.{c,h}"
  ext.ext_dir        = 'ext/casper_unique_file'
  ext.lib_dir        = 'lib/casper_unique_file'
  ext.gem_spec       = gemspec
end
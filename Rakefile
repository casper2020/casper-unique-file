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
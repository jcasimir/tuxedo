require 'rspec/core/rake_task'
require './lib/tuxedo/rake_task'
require 'tuxedo/rake_task'
require 'bundler'

Bundler::GemHelper.install_tasks

Tuxedo::RakeTask.new do
end

RSpec::Core::RakeTask.new do |t|
  t.pattern = "./spec/**/*_spec.rb"
end

# Taken from RefineryCMS
# https://github.com/resolve/refinerycms/blob/master/core/lib/tasks/refinery.rake
desc 'Removes trailing whitespace across the entire application.'
task :whitespace do
  require 'rbconfig'

  Dir.chdir(File.expand_path("..", __FILE__)) do
    if RbConfig::CONFIG['host_os'] =~ /linux/
      sh %{find . -name '*.*rb' -exec sed -i 's/\t/ /g' {} \\; -exec sed -i 's/ *$//g' {} \\; }
    elsif RbConfig::CONFIG['host_os'] =~ /darwin/
      sh %{find . -name '*.*rb' -exec sed -i '' 's/\t/ /g' {} \\; -exec sed -i '' 's/ *$//g' {} \\; }
    else
      puts "This doesn't work on systems other than OSX or Linux. Please use a custom whitespace tool for your platform '#{RbConfig::CONFIG["host_os"]}'."
    end
  end
end

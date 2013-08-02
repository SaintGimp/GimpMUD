require 'rubocop/rake_task'
require 'rspec/core/rake_task'

task :default => [:rubocop, :spec]

desc 'Run RuboCop'
Rubocop::RakeTask.new(:rubocop) do |task|
  # don't abort rake on failure
  task.fail_on_error = false
end

desc 'Run specs'
RSpec::Core::RakeTask.new(:spec)

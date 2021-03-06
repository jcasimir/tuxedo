require 'rake'
require 'rake/tasklib'
require 'tuxedo'

module Tuxedo
  class RakeTask < ::Rake::TaskLib
    include ::Rake::DSL if defined?(::Rake::DSL)

    attr_accessor :name
    attr_accessor :fail_on_error
    attr_accessor :cane_opts

    def initialize(*args)
      @name = args.shift || :style
      @cane_opts = ["--style-glob", "**/*.rb"]
      @fail_on_error = true

      yield self if block_given?

      unless ::Rake.application.last_comment
        desc %(Check code quality metrics with Tuxedo)
      end

      task name do
        Tuxedo.output_to_console
      end
    end
  end
end

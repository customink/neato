require 'rubygems'
require 'rubygems/command'
require 'rubygems/commands/install_command'

module Neato
  module Installer

    def self.install(name, version)
      cmd = Gem::Commands::InstallCommand.new
      cmd.options[:ignore_dependencies] = true
      cmd.options[:args] = [name]
      cmd.options[:version] = version
      cmd.ui = Gem::SilentUI.new
      cmd.ui.define_singleton_method(:terminate_interaction) { |*_| nil }
      cmd.execute
    end

    def self.install_all
      Deps::SASS_LIBS.each { |lib| install(*lib) }
    end

  end
end

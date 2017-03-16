require 'sass_paths'
require 'neato/version'
require 'neato/sass'
require 'neato/deps'
require 'neato/installer'
require 'neato/paths'

module Neato
  def self.root
    @root ||= Pathname.new File.expand_path File.join(File.dirname(__FILE__), '..')
  end

  Installer.install_all
  SassPaths.append Neato.root.join('app/assets/stylesheets')
  SassPaths.append_gem_path 'neat', Deps.bundled_sass_paths('neat')
  SassPaths.append_gem_path 'bourbon', Deps.bundled_sass_paths('bourbon')
end

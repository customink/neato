require 'sass_paths'
require 'neato/version'
require 'neato/sass'
require 'neato/deps'
require 'neato/installer'
require 'neato/paths'

module Neato
  Installer.install_all
end

SassPaths.append_gem_path 'neat', 'app/assets/stylesheets'
SassPaths.append_gem_path 'bourbon', 'app/assets/stylesheets'

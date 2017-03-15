require 'bundler/inline'

module Neato
  module Installer

    ADDITIONAL_SPECS = [
      ['neat', '2.0.0']
    ]

    def self.gemfile_specs
      File.read(Bundler.default_gemfile)
    end

    def self.additional_specs
      ADDITIONAL_SPECS.map do |spec|
        name, version = spec
        "gem #{name.inspect}, #{version.inspect}"
      end.join("\n")
    end

    def self.additional_specs_file
      "source 'https://rubygems.org'\n#{additional_specs}"
    end

    def self.all_specs
      gemfile_specs + additional_specs
    end

    begin
      gemfile(true, ui: Bundler::UI::Silent.new) { eval(additional_specs_file) }
    rescue
    end

  end
end

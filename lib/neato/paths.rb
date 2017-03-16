module Neato
  module Paths

    def self.gem_path_bundled(gem)
      Gem::Specification.find_all_by_name(gem).first.full_gem_path
    end

    def self.gem_path_installed(name, version)
      File.join Gem.dir, 'gems', gem_spec(name, version).full_name
    end

    def self.gem_spec(name, version)
      Gem::Specification.new do |s|
        s.name = name
        s.version = version
      end
    end

  end
end

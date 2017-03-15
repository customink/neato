module Neato
  module Paths

    def self.gem_spec(name, version)
      Gem::Specification.new do |s|
        s.name = name
        s.version = version
      end
    end

    def self.gem_path(name, version)
      File.join Gem.dir, 'gems', gem_spec(name, version).full_name
    end

    Deps::SASS_LIBS.each do |lib|
      spec = gem_spec(*lib)
      meth = spec.full_name.gsub /\.|-/, ''
      define_singleton_method(meth) { gem_path(*lib) }
    end

  end
end

module Neato
  module Deps

    SASS_LIBS = [
      ['neat', '2.0.0', 'core']
    ]

    BUNDLED_SASS_PATHS = {
      'neat' => 'app/assets/stylesheets'
    }

    def self.lib(name)
      SASS_LIBS.detect { |l| name == l[0] }
    end

    def self.bundled_sass_paths(name)
      BUNDLED_SASS_PATHS[name] || 'app/assets/stylesheets'
    end

    def self.imports
      @imports ||= SASS_LIBS.map do |l|
        name, version, _path = l
        ver = version[0, 3]
        /@import ['"](#{name})@#{ver}['"];/
      end
    end

    def self.replacements(template)
      libs = from_template(template)
      libs.each_with_object({}) do |l, reps|
        name, version, sass_path = l
        old_path = File.join(Paths.gem_path_bundled(name), bundled_sass_paths(name))
        new_path = File.join(Paths.gem_path_installed(name, version), sass_path)
        reps[old_path] = new_path
      end
    end

    def self.from_template(template)
      template.each_line.each_with_object([]) do |line, libs|
        imports.each do |import|
          libs << lib($1) if line =~ import
        end
      end
    end

  end
end

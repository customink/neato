begin
  require 'sassc'
rescue LoadError
  require 'sass'
end

module Neato
  module Sass

    def self.render(template)
      engine.new(template, options).render
    end

    def self.smart_render(template)
      reps = Deps.replacements(template)
      SassPaths.with_replacements(reps) do
        render(template)
      end
    end

    def self.engine
      c? ? ::SassC::Engine : ::Sass::Engine
    end

    def self.c?
      defined?(::SassC)
    end

    def self.options
      { syntax: :scss,
        style: :compact,
        cache: false,
        load_paths: ::Sass.load_paths }
    end

  end
end

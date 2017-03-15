begin
  require 'sassc'
rescue LoadError
  require 'sass'
end

module Neato
  module Sass

    def self.c?
      defined?(::SassC)
    end

    def self.engine
      c? ? ::SassC::Engine : ::Sass::Engine
    end

  end
end

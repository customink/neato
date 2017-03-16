module TestHelpers
  module SassHelpers

    def self.included(base)
      base.class_eval do
        before { Sass.logger = Sass::Logger::Base.new }
      end
    end

    private

    def assert_sass(sass_template, expected_css)
      actual_css = render_sass(sass_template)
      assert_equal squish_css(expected_css), squish_css(actual_css)
    end

    def eval_value(value)
      capture(:stderr) do
        template = <<-SASS
          $debug: #{value};
          @debug inspect($debug);
        SASS
        render_sass(template)
      end.sub(/.*DEBUG: /, '').chomp
    end

    def render_sass(template, options = {})
      options[:syntax] = :scss unless options.key?(:syntax)
      options[:style] = :compact unless options.key?(:style)
      options[:cache] = false
      options[:load_paths] = Sass.load_paths
      Neato::Sass.engine.new(template, options).render
    end

    def squish_css(css)
      lines = css.each_line.to_a
      lines.reject! { |l| l.strip == '' }
      lines.map!(&:strip)
      lines.join("\n")
    end

  end
end

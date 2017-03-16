module TestHelpers
  module SassHelpers

    def self.included(base)
      base.class_eval do
        before { Sass.logger = Sass::Logger::Base.new }
      end
    end

    private

    def assert_sass(sass_template, expected_css)
      actual_css = Neato::Sass.render(sass_template)
      assert_equal squish_css(expected_css), squish_css(actual_css)
    end

    def squish_css(css)
      lines = css.each_line.to_a
      lines.reject! { |l| l.strip == '' }
      lines.map!(&:strip)
      lines.join("\n")
    end

  end
end

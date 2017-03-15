$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'neato'
require 'minitest/autorun'
require 'support/stream_helpers'
require 'support/sass_helpers'

module Neato
  class Spec < Minitest::Spec

  end
end

require 'test_helper'

class NeatoTest < Neato::Spec

  it 'can import neat' do
    assert_sass <<-SASS, <<-CSS
      @import 'neat';
    SASS
      html { box-sizing: border-box; }
      *, *::after, *::before { box-sizing: inherit; }
    CSS
  end

end

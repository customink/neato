require 'test_helper'

class NeatoTest < Neato::Spec

  it 'can import neat v1 by default' do
    assert_sass <<-SASS, <<-CSS
      @import 'neat';
      $mobile: new-breakpoint(max-width 480px 4);
      .test { @include span-columns(6 of 6); }
    SASS
      html { box-sizing: border-box; }
      *, *::after, *::before { box-sizing: inherit; }
      .test { float: left; display: block; margin-right: 4.82916%; width: 100%; }
      .test:last-child { margin-right: 0; }
    CSS
  end

end

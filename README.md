
# Neato

**WARNING: This is proof of concept code!**


### What For?

Can a Ruby application bundle and/or use two versions of a Sass library?

Based on this [Neat GitHub Issue](https://github.com/thoughtbot/neat/issues/558) the proposal was to allow a special import to target a library and version. Like this:

```scss
@import 'neat@2.0';
.test { @include grid-container; }
```

Based on this import, the application would render using Neat v2.0.0 vs the bundled 1.8.0.


### High Level

* Bundling multiple gems of the same name in a single app is not a thing.
* Leverage the [SassPaths](https://github.com/customink/sass_paths) gem to setup `Sass.load_paths`.
* Then use `SassPaths.with_replacements` in v2.0 to swap load paths before rendering a Sass template.
* Implemented a primitive template scanner for Sass dependency detection/replacements.
* Created a simple `neat@2.0.scss` to delegate to whatever `neat` is in `Sass.load_paths`.

Please see the [neato_test.rb](test/neato_test.rb) file for the tests and browse the lib directory for details.


### Additional Gem Installation

There are so many ways a Ruby application could install additional dependences. For example, [bundler/inline](http://technology.customink.com/blog/2015/07/17/bundler-inline-gemfile-dependencies/) is a good choice in some cases. Others might be to use [Yarn](https://yarnpkg.com) alongside your application - and there may be others.

```ruby
require 'bundler/inline'
gemfile true, ui: Bundler::UI::Silent.new do
  gem 'neat', '2.0.0'
end
```

Using Bundler's inline would require a script as it posses issues inside a running application. I think Yarn might be a good choice alongside a Ruby or Rails application.


### Not Done

The `Neato::Sass` would use [SassC](https://github.com/sass/sassc) if installed. However I have not yet setup an Appraisal yet to test it. Should be fine though, I use SassC all the time this way.


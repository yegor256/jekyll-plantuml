# PlantUML Diagrams in Jekyll Static Sites

[![DevOps By Rultor.com][rultor-badge]][rultor]
[![We recommend RubyMine][rubymine-badge]][rubymine]

[![rake][rake-badge]][rake]
[![Gem Version][gem-badge]][gem]
[![Test Coverage][codecov-badge]][codecov]

Install it first:

```bash
gem install jekyll-plantuml
```

With Jekyll 2, simply add the gem to your `_config.yml` gems list:

```yaml
gems: ['jekyll-plantuml', ... your other plugins]
```

Or for previous versions,
create a plugin file within your Jekyll project's `_plugins` directory:

```ruby
# _plugins/plantuml-plugin.rb
require "jekyll-plantuml"
```

We highly recommend using Bundler. If you're using it, add this line
to your `Gemfile`:

```ruby
gem "jekyll-plantuml"
```

The plugin is compatible with [Jekyll 3.9.3][jekyll-3]
  and [Jekyll 4.3.2][jekyll-4].
You can find our [integration tests][test-jekylls],
  which prove the compatibility.

## Install plantuml.jar

Then, make sure [PlantUML][plantuml] is installed on your build machine, and can
be executed with a simple `plantuml` command.

On Ubuntu, just `apt-get install -y plantuml` should work.
However, if it doesn't, you can create a `/usr/bin/plantuml` with the
following content:

```bash
#!/usr/bin/env bash
java -jar /home/user/Downloads/plantuml.jar "$1" "$2"
```

Remember to change the path to the `plantuml.jar` file.

Then, set the executable permission of the file:

```bash
chmod +x /usr/bin/plantuml
```

## Test

Now, it's time to create a diagram in your Jekyll blog page:

```text
{% plantuml %}
[First] - [Second]
{% endplantuml %}
```

You can also include a file:

```text
{% plantuml_file foo.uml %}
```

Now, check [this blog post][blog-post]:
the UML sequence diagram in it is auto-generated using exactly this plugin.
The sources of the blog are available in [GitHub][blog-sources].

## How to contribute

Read [these guidelines][guidelines].
Make sure your build is green before you contribute
your pull request. You will need to have [Ruby][ruby] 2.3+ and
[Bundler][bundler] installed. Then:

```bash
bundle update
bundle exec rake
```

If it's clean and you don't see any error messages, submit your pull request.

[rultor-badge]: https://www.rultor.com/b/yegor256/jekyll-plantuml
[rultor]: https://www.rultor.com/p/yegor256/jekyll-plantuml
[rubymine-badge]: https://www.elegantobjects.org/rubymine.svg
[rubymine]: https://www.jetbrains.com/ruby/
[rake-badge]: https://github.com/yegor256/jekyll-plantuml/actions/workflows/rake.yml/badge.svg
[rake]: https://github.com/yegor256/jekyll-plantuml/actions/workflows/rake.yml
[gem-badge]: https://badge.fury.io/rb/jekyll-plantuml.svg
[gem]: https://badge.fury.io/rb/jekyll-plantuml
[codecov-badge]: https://img.shields.io/codecov/c/github/yegor256/jekyll-plantuml.svg
[codecov]: https://codecov.io/github/yegor256/jekyll-plantuml?branch=master
[jekyll-3]: https://jekyllrb.com/news/2023/01/29/jekyll-3-9-3-released/
[jekyll-4]: https://jekyllrb.com/news/2023/01/20/jekyll-4-3-2-released/
[test-jekylls]: https://github.com/yegor256/jekyll-plantuml/tree/master/test-jekylls
[plantuml]: http://plantuml.sourceforge.net/download.html
[blog-post]: http://www.yegor256.com/2014/06/01/aop-aspectj-java-method-logging.html
[blog-sources]: https://github.com/yegor256/blog
[guidelines]: https://www.yegor256.com/2014/04/15/github-guidelines.html
[ruby]: https://www.ruby-lang.org/en/
[bundler]: https://bundler.io/

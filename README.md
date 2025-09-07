[![DevOps By Rultor.com](https://www.rultor.com/b/yegor256/jekyll-plantuml)](https://www.rultor.com/p/yegor256/jekyll-plantuml)
[![We recommend RubyMine](https://www.elegantobjects.org/rubymine.svg)](https://www.jetbrains.com/ruby/)

[![rake](https://github.com/yegor256/jekyll-plantuml/actions/workflows/rake.yml/badge.svg)](https://github.com/yegor256/jekyll-plantuml/actions/workflows/rake.yml)
[![Gem Version](https://badge.fury.io/rb/jekyll-plantuml.svg)](https://badge.fury.io/rb/jekyll-plantuml)
[![Test Coverage](https://img.shields.io/codecov/c/github/yegor256/jekyll-plantuml.svg)](https://codecov.io/github/yegor256/jekyll-plantuml?branch=master)

Install it first:

```
$ gem install jekyll-plantuml
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

Highly recommend to use Bundler. If you're using it, add this line
to your `Gemfile`:

```
gem "jekyll-plantuml"
```

The plugin is compatible with
[Jekyll 3.9.3](https://jekyllrb.com/news/2023/01/29/jekyll-3-9-3-released/) and
[Jekyll 4.3.2](https://jekyllrb.com/news/2023/01/20/jekyll-4-3-2-released/).
You can find our integration tests, which prove the compatibility,
[here](https://github.com/yegor256/jekyll-plantuml/tree/master/test-jekylls).

## Install plantuml.jar

Then, make sure [PlantUML](http://plantuml.sourceforge.net/download.html)
is installed on your build machine, and can
be executed with a simple `plantuml` command.

On Ubuntu, just `apt-get install -y plantuml` should work.
However, if it doesn't, you can create a `/usr/bin/plantuml` with the
following content:

```
#!/usr/bin/env bash
java -jar /home/user/Downloads/plantuml.jar "$1" "$2"
```

Remember to change the path to the `plantuml.jar` file.

Then, set the executable permission of the file:

```
$ chmod +x /usr/bin/plantuml
```

## Test

Now, it's time to create a diagram, in your Jekyll blog page:

```
{% plantuml %}
[First] - [Second]
{% endplantuml %}
```

Now, check [this blog post](http://www.yegor256.com/2014/06/01/aop-aspectj-java-method-logging.html):
the UML sequence diagram in it is auto-generated using exactly this plugin.
The sources of the blog are available in [GitHub](https://github.com/yegor256/blog).

## How to contribute

Read [these guidelines](https://www.yegor256.com/2014/04/15/github-guidelines.html).
Make sure your build is green before you contribute
your pull request. You will need to have [Ruby](https://www.ruby-lang.org/en/) 2.3+ and
[Bundler](https://bundler.io/) installed. Then:

```
$ bundle update
$ bundle exec rake
```

If it's clean and you don't see any error messages, submit your pull request.

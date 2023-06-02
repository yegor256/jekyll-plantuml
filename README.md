[![rake](https://github.com/yegor256/jekyll-plantuml/actions/workflows/rake.yml/badge.svg)](https://github.com/yegor256/jekyll-plantuml/actions/workflows/rake.yml)
[![Gem Version](https://badge.fury.io/rb/jekyll-plantuml.svg)](http://badge.fury.io/rb/jekyll-plantuml)

Install it first:

```
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

Highly recommend to use Bundler. If you're using it, add this line
to your `Gemfile`:

```
gem "jekyll-plantuml"
```

## Install plantuml.jar

Then, make sure [PlantUML](http://plantuml.sourceforge.net/download.html)
is installed on your build machine, and can
be executed with a simple `plantuml` command.

For Linux user, you could create a `/usr/bin/plantuml` with contents:

```
#!/bin/bash

java -jar /home/user/Downloads/plantuml.jar "$1" "$2"
```

Remember to change the path to `plantuml.jar` file.

Then set executable permission.

```
chmod +x /usr/bin/plantuml
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


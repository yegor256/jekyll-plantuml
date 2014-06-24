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

Then, make sure [PlantUML](http://plantuml.sourceforge.net/download.html)
is installed on your build machine, and can
be executed with a simple `plantuml` command.

Now, it's time to create a diagram, in your Jekyll blog page:

```
{% plantuml %}
[First] - [Second]
{% endplantuml %}
```

Check [this blog post](http://www.yegor256.com/2014/06/01/aop-aspectj-java-method-logging.html).
UML sequence diagram in this page is generated with this plugin.
Blog sources are available in [Github](https://github.com/yegor256/blog).


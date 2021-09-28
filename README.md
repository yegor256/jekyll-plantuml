[![Gem Version](https://badge.fury.io/rb/jekyll-plantuml.svg)](http://badge.fury.io/rb/jekyll-plantuml)

## Install Jekyll plugin

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

-  For Linux user, you could create a `/usr/bin/plantuml` with contents:

  ```bash
  #!/bin/bash
  
  java -jar /home/user/Downloads/plantuml.jar "$1" "$2"
  ```

  Remember to specify the correct path to your `plantuml.jar` file.

  Then set executable permission.

  ```
  chmod +x /usr/bin/plantuml
  ```

- For Windows user, you could create a `plantuml.bat` script as follow:

  ```
  @echo off
  java -jar C:\plantuml.jar %1 %2 %3
  ```

  Remember to specify the correct path to your `plantuml.jar` file.

  Make sure the directory containing `plantuml.bat` is part of your PATH.



## Test

Now, it's time to create a diagram, in your Jekyll blog page:

```
{% plantuml %}
[First] - [Second]
{% endplantuml %}
```

Check [this blog post](http://www.yegor256.com/2014/06/01/aop-aspectj-java-method-logging.html).
UML sequence diagram in this page is generated with this plugin.
Blog sources are available in [Github](https://github.com/yegor256/blog).



## Troubleshooting

- ```
  C:/Ruby30-x64/lib/ruby/gems/3.0.0/gems/jekyll-plantuml-1.3.4/lib/jekyll-plantuml.rb:48:in `render': PlantUML error:  (RuntimeError)
  ```

  Probably the cause is `plantuml` command can't be executed.
  See [Install plantuml.jar](#Install plantuml.jar) paragraph.

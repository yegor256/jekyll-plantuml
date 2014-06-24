Add `plantuml.rb` to your `_plugins` directory and include 
diagrams like this:

```
{% plantuml %}
@startuml
[First] - [Second]
@enduml
{% endplantuml %}
```

Don't forget to add `gem require jekyll-plantuml` to your `Gemfile`.

That's it.


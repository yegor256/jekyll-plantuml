# (The MIT License)
#
# Copyright (c) 2014 Yegor Bugayenko
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the 'Software'), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

require 'digest'
require 'fileutils'

module Jekyll
  class PlantumlBlock < Liquid::Block
    def initialize(tag_name, markup, tokens)
      super
    end

    def render(context)
      site = context.registers[:site]
      name = Digest::MD5.hexdigest(super)
      if !File.exists?(File.join(site.dest, "uml/#{name}.uml"))
        uml = File.join(site.source, "uml/#{name}.uml")
        FileUtils.mkdir_p(File.dirname(uml))
        File.open(uml, 'w') { |f|
          f.write("@startuml\n")
          f.write(super)
          f.write("\n@enduml")
        }
        system("plantuml -tsvg #{uml}")
        site.static_files << Jekyll::StaticFile.new(
          site, site.source, 'uml', "#{name}.svg"
        )
      end
      "<p><img src='/uml/#{name}.svg' alt='UML' style='width:100%;'/></p>"
    end
  end
end

Liquid::Template.register_tag('plantuml', Jekyll::PlantumlBlock)

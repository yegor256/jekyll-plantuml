# frozen_string_literal: true

# (The MIT License)
#
# Copyright (c) 2014-2024 Yegor Bugayenko
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

# Jekyll main module.
# Author:: Yegor Bugayenko (yegor256@gmail.com)
# Copyright:: Copyright (c) 2014-2024 Yegor Bugayenko
# License:: MIT
module Jekyll
  # The main class
  class PlantumlBlock < Liquid::Block
    def initialize(tag_name, markup, tokens)
      super
      @html = (markup or '').strip
    end

    def render(context)
      site = context.registers[:site]
      name = Digest::MD5.hexdigest(super)
      unless File.exist?(File.join(site.dest, "uml/#{name}.svg"))
        uml = File.join(site.source, "uml/#{name}.uml")
        svg = File.join(site.source, "uml/#{name}.svg")
        if File.exist?(svg)
          puts "File #{svg} already exists (#{File.size(svg)} bytes)"
        else
          FileUtils.mkdir_p(File.dirname(uml))
          File.open(uml, 'w') do |f|
            f.write("@startuml\n")
            f.write(super)
            f.write("\n@enduml")
          end
          system("plantuml -tsvg #{uml}") or raise "PlantUML error: #{super}"
          site.static_files << Jekyll::StaticFile.new(
            site, site.source, 'uml', "#{name}.svg"
          )
          puts "File #{svg} created (#{File.size(svg)} bytes)"
        end
      end
      "<p><object data='#{site.baseurl}/uml/#{name}.svg' type='image/svg+xml' #{@html} class='plantuml'></object></p>"
    end
  end
end

Liquid::Template.register_tag('plantuml', Jekyll::PlantumlBlock)

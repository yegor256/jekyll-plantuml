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

require 'liquid'
require 'tmpdir'
require 'minitest/autorun'
require_relative 'test__helper'
require_relative '../lib/jekyll-plantuml'

# PlantumlBlock test.
# Author:: Yegor Bugayenko (yegor256@gmail.com)
# Copyright:: Copyright (c) 2023-2024 Yegor Bugayenko
# License:: MIT
class PlantumlBlockTest < Minitest::Test
  def test_failure
    Dir.mktmpdir 'test' do |dir|
      template = Liquid::Template.parse('{% plantuml %}[A] -> [B]{% endplantuml %}')
      config = {
        'destination' => File.join(dir, 'dest'),
        'source' => File.join(dir, 'source')
      }
      context = Liquid::Context.new({}, {}, { site: Jekyll::Site.new(Jekyll.configuration(config)) })
      block = template.root.nodelist.first
      output = block.render(context)
      assert(output.start_with?('<p><object'))
    end
  end
end

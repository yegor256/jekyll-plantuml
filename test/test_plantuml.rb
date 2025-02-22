# frozen_string_literal: true

# SPDX-FileCopyrightText: Copyright (c) 2014-2025 Yegor Bugayenko
# SPDX-License-Identifier: MIT

require 'liquid'
require 'tmpdir'
require_relative 'test__helper'
require_relative '../lib/jekyll-plantuml'

# PlantumlBlock test.
# Author:: Yegor Bugayenko (yegor256@gmail.com)
# Copyright:: Copyright (c) 2023-2025 Yegor Bugayenko
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

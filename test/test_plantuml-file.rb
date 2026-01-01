# frozen_string_literal: true

# SPDX-FileCopyrightText: Copyright (c) 2014-2026 Yegor Bugayenko
# SPDX-License-Identifier: MIT

require 'liquid'
require 'tmpdir'
require_relative 'test__helper'
require_relative '../lib/jekyll-plantuml-file'

# PlantumlBlock test.
# Author:: Yegor Bugayenko (yegor256@gmail.com)
# Copyright:: Copyright (c) 2023-2026 Yegor Bugayenko
# License:: MIT
class PlantumlFileTest < Minitest::Test
  def test_failure
    schema_file = File.join(Dir.getwd, 'test/schema.puml')
    puts "Schema file: #{schema_file}"
    Dir.mktmpdir 'test' do |dir|
      template = Liquid::Template.parse('{% plantuml_file %}schema.puml{% endplantuml_file %}')
      source_dir = File.join(dir, 'source')
      target_file = File.join(source_dir, 'schema.puml')
      puts "Target file: #{target_file}"
      puts "Folder exists: #{File.exist?(dir)}"
      puts "File exists: #{File.exist?(schema_file)}"
      FileUtils.mkdir_p(source_dir)
      FileUtils.cp(schema_file, target_file)
      puts "File exists after: #{File.exist?(target_file)}"
      config = {
        'destination' => File.join(dir, 'dest'),
        'source' => source_dir
      }
      context = Liquid::Context.new({}, {}, { site: Jekyll::Site.new(Jekyll.configuration(config)) })
      block = template.root.nodelist.first
      output = block.render(context)
      assert(output.start_with?('<p><object'))
    end
  end
end

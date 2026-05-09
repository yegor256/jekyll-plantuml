# frozen_string_literal: true

# SPDX-FileCopyrightText: Copyright (c) 2014-2026 Yegor Bugayenko
# SPDX-License-Identifier: MIT

require 'jekyll'

# Helpers for the PlantUML Jekyll plugin.
# Author:: Yegor Bugayenko (yegor256@gmail.com)
# Copyright:: Copyright (c) 2014-2026 Yegor Bugayenko
# License:: MIT
module Jekyll::PlantumlSupport
  module_function

  def plantuml_executable?
    paths = (ENV['PATH'] || '').split(File::PATH_SEPARATOR)
    exts = ENV['PATHEXT'] ? ENV['PATHEXT'].split(File::PATH_SEPARATOR) : ['']
    paths.any? do |p|
      exts.any? do |ext|
        candidate = File.join(p, "plantuml#{ext}")
        File.file?(candidate) && File.executable?(candidate)
      end
    end
  end

  def run_plantuml(uml, body)
    unless plantuml_executable?
      raise 'PlantUML executable was not found on PATH; please install PlantUML ' \
            '(see https://plantuml.com/starting) and make sure it can be invoked ' \
            "as 'plantuml' from the command line"
    end
    return if system("plantuml -tsvg #{uml} 2>&1")
    raise "PlantUML failed to compile the following snippet (see logs above):\n#{body}\n"
  end
end

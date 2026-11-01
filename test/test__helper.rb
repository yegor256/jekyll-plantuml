# frozen_string_literal: true

# SPDX-FileCopyrightText: Copyright (c) 2014-2026 Yegor Bugayenko
# SPDX-License-Identifier: MIT

$stdout.sync = true

require 'coverage'
require 'simplecov'
require 'simplecov-cobertura'
unless Coverage.running?
  SimpleCov.command_name('test')
  SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new(
    [
      SimpleCov::Formatter::HTMLFormatter,
      SimpleCov::Formatter::CoberturaFormatter
    ]
  )
  SimpleCov.minimum_coverage 80
  SimpleCov.coverage(:line) { minimum 80, per: :file }
  SimpleCov.start do
    skip 'test/'
    skip 'vendor/'
    skip 'target/'
  end
end

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new]
Minitest.load :minitest_reporter

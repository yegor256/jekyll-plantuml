# frozen_string_literal: true

# SPDX-FileCopyrightText: Copyright (c) 2014-2026 Yegor Bugayenko
# SPDX-License-Identifier: MIT

require 'English'
lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'version'

Gem::Specification.new do |s|
  s.required_rubygems_version = Gem::Requirement.new('>= 0') if s.respond_to? :required_rubygems_version=
  s.required_ruby_version = '>= 1.9.3'
  s.name = 'jekyll-plantuml'
  s.version = PlantUML::VERSION
  s.license = 'MIT'
  s.summary = 'Jekyll PlantUML Automation'
  s.description = 'PlantUML diagrams in Jekyll pages'
  s.authors = ['Yegor Bugayenko']
  s.email = 'yegor@tpc2.com'
  s.homepage = 'https://github.com/yegor256/jekyll-plantuml'
  s.files = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  s.executables = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.rdoc_options = ['--charset=UTF-8']
  s.extra_rdoc_files = %w[README.md LICENSE.txt]
  s.add_dependency 'jekyll', '>2.0'
  s.metadata['rubygems_mfa_required'] = 'true'
end

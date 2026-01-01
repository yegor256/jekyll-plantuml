# SPDX-FileCopyrightText: Copyright (c) 2014-2026 Yegor Bugayenko
# SPDX-License-Identifier: MIT

.ONESHELL:
.SHELLFLAGS: -e -o pipefail -c
.PHONY: clean sa env lint

SHELL = bash

TESTS = $(wildcard */)
all:
	for t in ${TESTS}; do
		cd $${t}
		bundle install
		bundle exec jekyll build
	done

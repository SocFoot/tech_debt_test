#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../log_parser'

LogParser.new(ARGV[0]).call

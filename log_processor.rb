# frozen_string_literal: true

require_relative 'log_result'

# This class is responsible of processing the a log file
class LogProcessor
  attr_reader :visited, :unique

  LINE_REGEX = /(.+) (.+)/.freeze
  def initialize(file_path)
    @file_path = file_path
    @visited = LogResult.new
    @unique = LogResult.new
    @visited_hash = {}
  end

  def parse
    File.readlines(file_path).each.with_index do |line, _i|
      LINE_REGEX =~ line

      parse_line(Regexp.last_match(1), Regexp.last_match(2))
    end

    true
  end

  def results
    @results ||= [@visited.value, @unique.value]
  end

  private

  def parse_line(path, ip)
    if path_and_ip_set?(path, ip)
      visited.inc(path)
    elsif path_set?(path)
      inc(path)
    else
      set(path)
    end
    visited_hash[path][ip] = true
  end

  def inc(value)
    visited.inc(value)
    unique.inc(value)
  end

  def set(value)
    visited_hash[value] = {}
    visited.set(value)
    unique.set(value)
  end

  def path_and_ip_set?(path, ip)
    visited_hash[path] && visited_hash[path][ip]
  end

  def path_set?(path)
    visited_hash[path]
  end

  attr_reader :file_path, :visited_hash
end

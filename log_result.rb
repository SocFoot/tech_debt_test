# frozen_string_literal: true

# This class deals with the visits arithmetics
class LogResult
  def initialize
    @value = {}
  end

  def inc(path)
    value[path] = value[path] + 1
  rescue NoMethodError
    raise "path #{path} is not set"
  end

  def set(path)
    value[path] = 1
  end

  attr_accessor :value
end

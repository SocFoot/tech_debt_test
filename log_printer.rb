# frozen_string_literal: true

# This class is responsible of formating the input
class LogPrinter
  attr_accessor :input

  def initialize(message)
    @message = message
  end

  def print_formated_results
    sort
    print_result
  end

  private

  def sort
    self.input = input.sort_by { |_key, val| -val }
  end

  def print_result
    print @message
    input.each { |key, val| print "#{key}:#{val}" }
  end
end

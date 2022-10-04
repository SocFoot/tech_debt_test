# frozen_string_literal: true

require_relative 'log_processor'
require_relative 'log_printer'

# This class implement the feature required parsing a log file and print and sorted results.
class LogParser
  def initialize(file_path)
    @file_path = file_path
  end

  def call
    @processor = LogProcessor.new(file_path)
    processor.parse

    print_result('visited paths')
    print_result("\nunique paths")
  end

  private

  def print_result(message)
    printer = LogPrinter.new(message)
    printer.input = processor.results.pop
    printer.print_formated_results
  end

  attr_accessor :file_path, :processor
end

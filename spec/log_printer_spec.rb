# frozen_string_literal: true

require_relative '../log_printer'

require 'spec_helper'

RSpec.describe LogPrinter do
  subject { described_class.new('') }

  it 'prints number of visited paths' do
    subject.input = []
    expect(subject.print_formated_results).to eq([])
  end
end

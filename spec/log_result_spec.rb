# frozen_string_literal: true

require_relative '../log_result'

require 'spec_helper'

RSpec.describe LogResult do
  subject { described_class.new }

  it 'increment value of 1' do
    subject.set('/hello')
    subject.inc('/hello')
    expect(subject.value['/hello']).to eq(2)
  end

  it 'set the value' do
    subject.set('/hello')

    expect(subject.value['/hello']).to eq(1)
  end
end

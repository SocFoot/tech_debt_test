# frozen_string_literal: true

require_relative '../log_processor'

require 'spec_helper'

RSpec.describe LogProcessor do
  subject { described_class.new(path).parse }

  let(:path) { './webserver.log' }
  it 'prints number of visited paths' do
    expect(subject).to eq(true)
  end
end

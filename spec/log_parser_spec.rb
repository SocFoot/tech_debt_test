# frozen_string_literal: true

require_relative '../log_parser'

require 'spec_helper'

RSpec.describe LogParser do
  subject { described_class.new(path).call }

  let(:path) { './webserver.log' }
  it 'prints number of visited paths' do
    expect { subject }.to output(
      %r{/about/2:90/contact:89/index:82/about:81/help_page/1:80/home:78}
    ).to_stdout
  end

  it 'prints number of unique paths' do
    expect { subject }.to output(
      %r{/help_page/1:23/contact:23/home:23/index:23/about/2:22/about:21}
    ).to_stdout
  end
end

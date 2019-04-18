# frozen_string_literal: true

require 'spec_helper'
require_relative '../../lib/app.rb'

RSpec.describe Statistics::UniquePageViews do
  subject { described_class.new(log_path) }

  let(:log_path) do
    File.join(File.expand_path('../fixtures', __dir__), 'webserver.log')
  end

  let(:expected_statistics) do
    {
      '/about' => 21,
      '/about/2' => 22,
      '/contact' => 23,
      '/help_page/1' => 23,
      '/home' => 23,
      '/index' => 23
    }
  end

  it 'prints statistics' do
    expect(subject.generate!).to include expected_statistics
  end
end

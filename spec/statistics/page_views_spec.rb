# frozen_string_literal: true

require 'spec_helper'
require_relative '../../lib/app.rb'

# TODO: move to shared examples

RSpec.describe Statistics::PageViews do
  subject { described_class.new(log_instance) }

  let(:log_path) do
    File.join(File.expand_path('../fixtures', __dir__), 'webserver.log')
  end
  let(:log_instance) { Factories::Log.build(log_path) }

  let(:expected_statistics) do
    {
      '/about' => 81,
      '/about/2' => 90,
      '/contact' => 89,
      '/help_page/1' => 80,
      '/home' => 78,
      '/index' => 82
    }
  end

  it 'returns expected page views statistics' do
    expect(subject.generate!).to include expected_statistics
  end
end

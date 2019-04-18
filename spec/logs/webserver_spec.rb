# frozen_string_literal: true

require 'spec_helper'
require_relative '../../lib/app.rb'

RSpec.describe Logs::Webserver do
  subject { described_class.new(log_path) }

  let(:log_path) do
    File.join(File.expand_path('../fixtures', __dir__), 'webserver_3_lines.log')
  end
  let(:expected_lines_array) do
    [
      "/help_page/1 451.106.204.921",
      "/home 444.701.448.104",
      "/index 929.398.951.889"
    ]
  end
  let(:line_sample) do
    "/index 929.398.951.889"
  end

  describe '#lines' do
    it { expect(subject.lines).to eq expected_lines_array }
  end

  describe '#extract_ip_from' do
    it { expect(subject.extract_ip_from(line_sample)).to eq '929.398.951.889' }
  end

  describe '#extract_url_from' do
    it { expect(subject.extract_url_from(line_sample)).to eq '/index' }
  end
end

# frozen_string_literal: true

require 'spec_helper'
require_relative '../../lib/app.rb'

RSpec.describe Factories::Log do
  subject { described_class }

  let(:log_path) do
    File.join(File.expand_path('../fixtures', __dir__), 'webserver.log')
  end

  context 'when webserver logs provided' do
    it 'returns a webserver log instance' do
      expect(described_class.build(log_path)).to be_kind_of(Logs::Webserver)
    end
  end

  context 'when unknown logs provided' do
    let(:log_path) do
      File.join(File.expand_path('../fixtures', __dir__), 'unknown.log')
    end

    it 'raises an error' do
      expect { described_class.build(log_path) }.to raise_error(Factories::Log::UnknownLogTypeError)
    end
  end
end

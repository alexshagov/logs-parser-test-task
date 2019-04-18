# frozen_string_literal: true

require 'spec_helper'
require_relative '../lib/app.rb'

RSpec.describe App do
  include IntegrationHelpers

  context 'with arguments' do
    let(:log_path) do
      File.join(File.expand_path('../spec/fixtures', __dir__), 'webserver.log')
    end

    it 'runs successfully without errors' do
      expect(run_app(arg: "--log #{log_path}")).to include('Starting...')
      expect(run_app(arg: "--log #{log_path}")).to_not include('Something went wrong')
    end

    context 'when invalid log path provided' do
      let(:log_path) do
        File.join(File.expand_path('../INVALID', __dir__), 'webserver.log')
      end

      it 'returns prints an error message' do
        expect(run_app(arg: "--log #{log_path}")).to include('Something went wrong')
      end
    end
  end

  context 'with no arguments' do
    it do
      expect(run_app(arg: nil)).to include('Usage: ruby app.rb [options]')
    end
  end
end

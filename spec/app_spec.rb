require 'spec_helper'
require_relative '../lib/app.rb'

include IntegrationHelpers

RSpec.describe App do
  context 'with arguments' do
    it do
      expect(run_app(log_name: 'webserver.log')).to include('Starting...')
    end
  end

  context 'with no arguments' do
    it do
      expect(run_app(log_name: nil)).to include('No log file provided!')
    end
  end
end

require 'spec_helper'
require_relative '../lib/app.rb'

include IntegrationHelpers

RSpec.describe App do
  context 'with arguments' do
    it do
      expect(run_app(arg: '--log webserver.log')).to include('Starting...')
    end
  end

  context 'with no arguments' do
    it do
      expect(run_app(arg: nil)).to include('Usage: ruby app.rb [options]')
    end
  end
end

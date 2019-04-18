# frozen_string_literal: true

require 'spec_helper'
require_relative '../../lib/app.rb'
require_relative 'shared_examples_for_statistics'

RSpec.describe Statistics::PageViews do
  it_behaves_like 'statistics with an expected result' do
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
  end
end

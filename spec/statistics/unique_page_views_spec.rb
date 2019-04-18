# frozen_string_literal: true

require 'spec_helper'
require_relative '../../lib/app.rb'
require_relative 'shared_examples_for_statistics'

RSpec.describe Statistics::UniquePageViews do
  it_behaves_like "statistics with an expected result" do
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
  end
end

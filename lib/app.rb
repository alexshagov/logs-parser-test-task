# frozen_string_literal: true

# @author Alexander Shagov @alexshgov

require 'optparse'
require_relative 'statistics/page_views'
require_relative 'statistics/unique_page_views'

class App
  class << self
    BANNER_MESSAGE = 'Usage: ruby app.rb [options]'
    HELP_MESSAGE = 'Begin execution with a given FILEPATH'
    SUPPORT_MESSAGE = 'Something went wrong, contact our support +1012489124'

    # rubocop:disable Metrics/MethodLength
    def run!
      args = ARGV.empty? ? %w[--help] : ARGV

      OptionParser.new do |parser|
        parser.banner = BANNER_MESSAGE

        parser.on('-l', '--log FILEPATH', HELP_MESSAGE) do |log|
          puts 'Starting...'
          Statistics::PageViews.new(log).print!
          Statistics::UniquePageViews.new(log).print!
        rescue StandardError
          puts SUPPORT_MESSAGE
        end

        parser.on('-h', '--help', 'Prints this help') do
          puts parser
          exit
        end
      end.parse! args
    end
    # rubocop:enable Metrics/MethodLength
  end
end

App.run!

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

    def run!
      ARGV << '-h' if ARGV.empty?

      OptionParser.new do |parser|
        parser.banner = BANNER_MESSAGE

        parser.on('-l', '--log FILEPATH', HELP_MESSAGE) do |log|
          puts 'Starting...'
          puts 'Overall page views:'
          puts Statistics::PageViews.new(log).generate!
          puts 'Uniq page views:'
          puts Statistics::UniquePageViews.new(log).generate!
        rescue StandardError
          puts SUPPORT_MESSAGE
        end

        parser.on('-h', '--help', 'Prints this help') do
          puts parser
          exit
        end
      end.parse! ARGV
    end
  end
end

App.run!

require 'optparse'
require_relative 'statistics/page_views'
require_relative 'statistics/unique_page_views'


class App
  class << self
    def run!
      args = ARGV.empty? ? %w[--help] : ARGV

      OptionParser.new do |parser|
        parser.banner = "Usage: ruby app.rb [options]"

        parser.on("-l", "--log FILEPATH", "Begin execution with a given FILEPATH") do |log|
          puts "Starting..."
          
          Statistics::PageViews.new(log).print!
          Statistics::UniquePageViews.new(log).print!
        end

        parser.on("-h", "--help", "Prints this help") do
          puts parser
          exit
        end

      end.parse! args
    end
  end
end

App.run!

require 'optparse'



class App
  class << self
    def run!
      args = ARGV.empty? ? %w[--help] : ARGV

      OptionParser.new do |parser|
        parser.banner = "Usage: ruby app.rb [options]"

        parser.on("-l", "--log FILEPATH", "Begin execution with a given FILEPATH") do |log|
          puts log
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

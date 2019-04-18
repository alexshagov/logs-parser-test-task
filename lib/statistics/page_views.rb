# frozen_string_literal: true

module Statistics
  class PageViews
    attr_reader :log_path

    def initialize(log_path)
      @log_path = log_path
    end

    def print!
      read_log!

      analyze
    end

    private

    # @return [Hash] the resulting hash, e.g.
    # { "url" => value }, where `value` is the views count
    def analyze
      log_lines.each_with_object({}) do |line, stats|
        stats[extract_url_from(line)] = stats[extract_url_from(line)].to_i.succ
      end
    end

    def log_lines
      log_content.split("\n")
    end

    def extract_url_from(line)
      line.split(' ').first
    end

    def read_log!
      @read_log ||= File.read(log_path)
    end
    alias log_content read_log!
  end
end

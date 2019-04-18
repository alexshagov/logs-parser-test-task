# frozen_string_literal: true

module Statistics
  class Base
    attr_reader :log_path

    def initialize(log_path)
      @log_path = log_path
    end

    def generate!
      read_log!

      analyze
    end

    # @return [Hash] the resulting hash
    # must be overwritten accordingly
    def analyze; end

    def log_lines
      log_content.split("\n")
    end

    def extract_url_from(line)
      line.split(' ').first
    end

    def extract_ip_from(line)
      line.split(' ').last
    end

    def read_log!
      @read_log ||= File.read(log_path)
    end
    alias log_content read_log!
  end
end

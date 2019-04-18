module Logs
  class Webserver
    attr_reader :filepath

    def initialize(filepath)
      @filepath = filepath
    end

    def lines
      log_content.split("\n")
    end

    def extract_url_from(line)
      line.split(' ').first
    end

    def extract_ip_from(line)
      line.split(' ').last
    end

    def read_log!
      @read_log ||= File.read(filepath)
    end
    alias log_content read_log!
  end
end

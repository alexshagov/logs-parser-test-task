module Statistics
  class PageViews
    attr_reader :log_path, :log_content

    def initialize(log_path)
      @log_path = log_path
    end

    def print!
      read_log!

      analyze
    end

    private

    # @return [Hash] the resulting hash, e.g.
    # { "url" => value }, where `value` is calculated according to a rule
    def analyze
      log_lines.inject({}) do |stats, line|
        stats[extract_url_from(line)] = stats[extract_url_from(line)].to_i.succ
        stats
      end
    end

    def log_lines
      log_content.split("\n")
    end

    def extract_url_from(line)
      line.split(' ').first
    end

    def read_log!
      @log_content ||= File.read(log_path)
    end
  end
end

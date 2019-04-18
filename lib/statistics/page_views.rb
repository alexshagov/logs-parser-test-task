module Statistics
  class PageViews
    attr_reader :log_path, :log_content

    def initialize(log_path)
      @log_path = log_path
    end

    def print!
      read_log
    end

    private

    def read_log
      @log_content ||= File.read(log_path)
    end
  end
end

module Logs
  class Webserver
    attr_reader :filepath

    def initialize(filepath)
      @filepath = filepath
    end
  end
end

# frozen_string_literal: true

module Statistics
  class Views
    attr_reader :log

    # @param [Log, #lines, #extract_url_from(..), #extract_ip_from(..)]
    # a Log instance with corresponding interface
    def initialize(log)
      @log = log
    end

    def generate!
      analyze!
    end

    private

    # @return [Hash] the resulting hash
    # must be overwritten accordingly
    def analyze!; end
  end
end

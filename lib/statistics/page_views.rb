# frozen_string_literal: true

require_relative 'views'

module Statistics
  class PageViews < Views
    private

    # @return [Hash] the resulting hash, e.g.
    # { "url" => value }, where `value` is the views count
    def analyze!
      log.lines.each_with_object({}) do |line, stats|
        stats[log.extract_url_from(line)] =
          stats[log.extract_url_from(line)].to_i.succ
      end
    end
  end
end

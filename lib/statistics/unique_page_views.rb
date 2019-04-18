# frozen_string_literal: true

require_relative 'base'

module Statistics
  class UniquePageViews < Base
    attr_reader :page_views_by_ip

    private

    # @return [Hash] the resulting hash, e.g.
    # { "url" => value }, where `value` is the unique views count
    def analyze
      page_views = page_views_stats_klass.new(log_path).generate!
      uniq_page_views_by_ip

      page_views.keys.each_with_object({}) do |url, stats|
        views_count =
          uniq_page_views_by_ip.values.flatten.select do |visited_page|
            visited_page == url
          end.count
        stats[url] = views_count
      end
    end

    # @return [Hash] the resulting hash, e.g.
    # { "ip" => [Array] }, where `Array` is a list of uniq visited urls
    def uniq_page_views_by_ip
      @page_views_by_ip ||=
        log_lines.each_with_object({}) do |line, stats|
          stats[extract_ip_from(line)] = [] if stats[extract_ip_from(line)].nil?
          stats[extract_ip_from(line)] << extract_url_from(line)
        end

      page_views_by_ip.tap { |views| views.values.each(&:uniq!) }
    end

    def page_views_stats_klass
      PageViews
    end
  end
end

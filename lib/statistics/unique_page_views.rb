# frozen_string_literal: true

require_relative 'base'

module Statistics
  class UniquePageViews < Base
    attr_reader :page_views_by_ip

    private

    # @return [Hash] the resulting hash, e.g.
    # { "url" => value }, where `value` is the unique views count
    def analyze!
      page_views = page_views_stats_klass.new(log).generate!
      page_views.keys.each_with_object({}) do |url, stats|
        stats[url] = views_count_for(url)
      end
    end

    # @return [Hash] the resulting hash, e.g.
    # { "ip" => [Array] }, where `Array` is a list of uniq visited urls
    def uniq_page_views_by_ip
      @page_views_by_ip ||=
        log.lines.each_with_object({}) do |line, stats|
          group_urls_by_ip!(stats, line)
        end

      page_views_by_ip.tap { |views| views.values.each(&:uniq!) }
    end

    def views_count_for(url)
      uniq_page_views_by_ip.values.flatten.select do |visited_page|
        visited_page == url
      end.count
    end

    def group_urls_by_ip!(stats, line)
      stats[log.extract_ip_from(line)] ||= []
      stats[log.extract_ip_from(line)] << log.extract_url_from(line)
    end

    def page_views_stats_klass
      PageViews
    end
  end
end

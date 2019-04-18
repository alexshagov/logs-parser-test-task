module Statistics
  class UniquePageViews < PageViews
    attr_reader :page_views_by_ip

    private

    # alias_method :page_views_statistics, :analyze

    # @return [Hash] the resulting hash, e.g.
    # { "url" => value }, where `value` is calculated according to a rule
    def analyze
      page_views = super
      uniq_page_views_by_ip

      page_views.keys.inject({}) do |stats, url|
        views_count =
          uniq_page_views_by_ip.values.flatten.select do |visited_page|
            visited_page == url
          end.count
        stats[url] = views_count
        stats
      end
    end

    # @return [Hash] the resulting hash, e.g.
    # { "ip" => [Array] }, where `Array` is a list of uniq visited urls
    def uniq_page_views_by_ip
      @page_views_by_ip ||=
        log_lines.inject({}) do |stats, line|
          stats[extract_ip_from(line)] = [] if stats[extract_ip_from(line)].nil?
          stats[extract_ip_from(line)] << extract_url_from(line)

          stats
        end

      page_views_by_ip.tap { |views| views.values.each(&:uniq!) }
    end

    def extract_ip_from(line)
      line.split(' ').last
    end
  end
end

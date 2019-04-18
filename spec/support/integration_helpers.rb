# frozen_string_literal: true

require 'open3'
require_relative '../../lib/app.rb'

module IntegrationHelpers
  def run_app(arg: '--l webserver.log')
    log_path ||= File.join(File.expand_path('../fixtures', __dir__), 'webserver.log')
    chdir ||= File.expand_path('../../lib', __dir__)
    output, _status = Open3.capture2(
      {},
      "ruby app.rb #{arg}",
      chdir: chdir
    )

    output
  end
end

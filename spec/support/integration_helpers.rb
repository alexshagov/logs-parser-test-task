require "open3"

module IntegrationHelpers
  def run_app(log_name: 'webserver.log')
    log_path ||= File.join(File.expand_path("../fixtures", __dir__), log_name.to_s)
    chdir ||= File.expand_path("../../lib", __dir__)
    output, _status = Open3.capture2(
              {},
              "ruby app.rb --log #{log_name}",
              chdir: chdir
            )
    output
  end
end

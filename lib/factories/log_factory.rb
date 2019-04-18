module Factories
  class Log
    class UnknownLogTypeError < StandardError; end

    class << self
      def build(filepath)
        if filepath.match?(/webserver/)
          Logs::Webserver.new(filepath)
        else
          raise Factories::Log::UnknownLogTypeError
        end
      end
    end
  end
end

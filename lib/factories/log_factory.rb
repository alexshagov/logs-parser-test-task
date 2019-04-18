# frozen_string_literal: true

module Factories
  class Log
    class UnknownLogTypeError < StandardError; end

    class << self
      def build(filepath)
        return Logs::Webserver.new(filepath) if filepath.match?(/webserver/)

        raise Factories::Log::UnknownLogTypeError
      end
    end
  end
end

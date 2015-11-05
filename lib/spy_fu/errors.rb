module SpyFu
  module Errors
    RESPONSE_ERRORS = {
      'authentication Failed' => 'AuthenticationFailed'
    }.freeze

    def self.response_error(key)
      error = RESPONSE_ERRORS.key?(key) ? RESPONSE_ERRORS[key] : 'Error'
      "SpyFu::Errors::#{error}"
    end

    class Error < StandardError
      attr_accessor :response

      def initialize(msg = 'Internal Service Error')
        super(msg)
      end
    end

    MissingUrl = Class.new(Error)
    MissingSecretKey = Class.new(Error)
    MissingRequireParameters = Class.new(Error)
    AuthenticationFailed = Class.new(Error)
  end
end

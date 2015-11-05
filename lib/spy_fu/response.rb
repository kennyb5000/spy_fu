module SpyFu
  class Response
    attr_reader :parsed_response, :code

    def initialize(raw_response)
      @parsed_response = ActiveSupport::JSON.decode(raw_response.body.gsub('-2147483648', '""'))
      @code = raw_response.code
    end

    def call
      return parsed_response if success?

      if parsed_response.is_a?(Hash)
        error_key = parsed_response.keys.first
        error_string = parsed_response.values.join('. ')
      else
        error_key = ''
        error_string = parsed_response
      end
      error = SpyFu::Errors.response_error(error_key)
      fail error.constantize, "#{error_key} : #{error_string}"
    end

    def success?
      code == 200
    end
  end
end

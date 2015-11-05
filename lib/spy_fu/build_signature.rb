module SpyFu
  class BuildSignature
    attr_reader :message, :secret_key

    def initialize(message, secret_key = SpyFu.configuration.secret_key)
      @message = message
      @secret_key = secret_key
    end

    def call
      fail SpyFu::Errors::MissingSecretKey if @secret_key.blank?
      Base64.encode64(OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha256'), secret_key, message)).strip
    end
  end
end

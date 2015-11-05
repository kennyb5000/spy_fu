require 'net/http'

module SpyFu
  class BuildRequest
    attr_reader :url, :url_path, :query_string

    def initialize(url_path, query_string)
      @url_path = url_path
      @url = SpyFu.configuration.base_url + url_path
      @query_string = query_string
    end

    def build_request
      url_with_path = join_url_and_query

      timestamp = build_timestamp

      message = SpyFu::BuildMessage.new(url_path, query_string, timestamp).call

      signature = SpyFu::BuildSignature.new(message).call

      headers = { 'Authentication' => "#{SpyFu.configuration.user_id}:#{signature}", 'Timestamp' => timestamp }

      HTTParty.get(url_with_path, headers: headers)
    end

    def join_url_and_query
      if query_string.present? then
        "#{url}?#{query_string.to_a.sort.map { |x| "#{x[0]}=#{URI.encode(x[1].to_s)}" }.join('&')}"
      else
        url
      end
    end

    def build_timestamp
      Time.now.getutc.strftime '%A, %B %d, %Y %I:%M:%S %p'
    end
  end
end

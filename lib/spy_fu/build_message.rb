module SpyFu
  class BuildMessage
    attr_reader :url_path, :query_string, :timestamp

    def initialize(url_path, query_string, timestamp)
      @url_path = url_path
      @query_string = query_string
      @timestamp = timestamp
    end

    def call
      fail SpyFu::Errors::MissingUrl if url_path.nil? || url_path.empty?

      paramters = build_canonicalized_params

      ['GET', timestamp, url_path, paramters].join("\n")
    end

    def build_canonicalized_params
      parameters = query_string.to_a.sort.map { |x| "#{x[0]}=#{x[1]}" }.join('&')

      parameters.blank? ? '' : parameters
    end
  end
end

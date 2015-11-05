module SpyFu
  module Requests
    class KssApi
      def self.kss_kws(parameters)
        SpyFu::Request.new('/apis/kss_api/kss_kws', %i(q r), parameters).send_request
      end

      # q (required) - a keyword-based query
      #
      #   This is the main input to the API.
      #   You give a keyword (or keyword-based query, using wildcards such as * and ?)
      #     and we give back a list of keywords.
      #
      # r (required) - max number of results
      #
      #   We require that you give us a max number of results. Paging is not implemented.
      #   So if you make a request where r = 100 and get 100 results then you must query again with r = 1000
      #     or the like to attempt to get all rows if that's what you're all about.
      #
      #   maxRows maps to an Int32, so Int32.MaxValue is the highest value you can enter, technically.
      #   But you are charged by the row returned and r impacts performance so it is not recommended that you do this.
    end
  end
end

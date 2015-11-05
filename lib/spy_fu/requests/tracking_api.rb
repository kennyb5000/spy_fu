module SpyFu
  module Requests
    class TrackingApi
      def self.add_terms(parameters, keywords)
        if keywords.present?
          parameters[:keywordCsv] =  Base64.encode64(Array.wrap(keywords).join(', ')).strip.gsub(/\n/, '')
        end
        required_params = %i(groupName domainName isSeo isPpc keywordCsv)
        SpyFu::Request.new('/apis/weeklytracking_api/add_terms',
                           required_params, parameters).send_request
      end

      # groupName - This will be the name for the list or group you are creating
      # domainName - This is the domain name that you want to track the keywords against
      # isSeo - pass true if you want to track the keywords on Seo, otherwise false
      # isPpc - pass true if you want to track the keywords on Ppc, otherwise false
      # keywordCsv - This is a list of the keywords you want to track in the following format:
      #              Base64Encode(<keyword1>,<keyword2>,<keyword3>)

      def self.get_groups
        SpyFu::Request.new('/apis/weeklytracking_api/get_groups', []).send_request
      end

      def self.get_terms(parameters)
        SpyFu::Request.new('/apis/weeklytracking_api/get_terms', %i(listId), parameters).send_request
      end

      # listId - The listId from the above call to get_groups

      def self.get_term_data(parameters)
        SpyFu::Request.new('/apis/weeklytracking_api/get_term_data', %i(isSeo domainId termId), parameters).send_request
      end

      # isSeo - pass true if you want the Organic historic data for the keyword; otherwise Ppc
      # domainId - the domainId that you want the historical data to be shown against
      # termId - the termId that you wish to track (given from the get_terms call above)

      def self.delete_term(parameters)
        SpyFu::Request.new('/apis/weeklytracking_api/delete_term', %i(listId domainId termId), parameters).send_request
      end

      # listId - ListId that the term is linked to. Listed previously from calling get_groups
      # domainId - DomainId that the term is linked to. Listed previously from calling get_groups
      # termId - The TermId of the keyword that you wish to delete; given by calling get_terms
    end
  end
end

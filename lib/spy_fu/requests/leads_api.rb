module SpyFu
  module Requests
    class LeadsApi
      def self.get_contact_card(parameters)
        SpyFu::Request.new('/apis/leads_api/get_contact_card', %i(domain), parameters).send_request
      end

      # domain (required) - the domain of interest as a string

      def self.get_grid(parameters)
        SpyFu::Request.new('/apis/leads_api/get_grid', %i(), parameters).send_request
      end

      # q (optional) - the query as a string
      # r (optional) - max number of results as an int
      # locationAndFacet (optional) - string
      # locationOrFacet (optional) - string
      # adBudgetFacet (optional) - string
      # seoClickFacet (optional) - string
      # contactFacet (optional) - string
      # includeTechFacet (optional) - string
      # excludeTechFacet (optional) - string
      # includeIndFacet (optional) - string
      # excludeIndFacet (optional) - string
      # sicFacet (optional) - string
      # naicFacet (optional) - string
    end
  end
end

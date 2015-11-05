module SpyFu
  module Requests
    class CoreApi
      def self.get_term_metrics_us(parameters)
        SpyFu::Request.new('/apis/core_api/get_term_metrics_us', %i(term), parameters).send_request
      end

      def self.get_term_metrics_uk(parameters)
        SpyFu::Request.new('/apis/core_api/get_term_metrics_uk', %i(term), parameters).send_request
      end

      def self.get_term_ranking_urls_us(parameters)
        SpyFu::Request.new('/apis/core_api/get_term_ranking_urls_us', %i(term), parameters).send_request
      end

      def self.get_term_ranking_urls_uk(parameters)
        SpyFu::Request.new('/apis/core_api/get_term_ranking_urls_uk', %i(term), parameters).send_request
      end

      def self.get_term_metrics_bulk_us(keywords)
        parameters = {}
        if keywords.present?
          parameters[:termCSV] =  Base64.encode64(Array.wrap(keywords).join(', ')).strip.gsub(/\n/, '')
        end
        SpyFu::Request.new('/apis/core_api/get_term_metrics_bulk_us', %i(termCSV), parameters).send_request
      end

      def self.get_term_metrics_bulk_uk(keywords)
        parameters = {}
        if keywords.present?
          parameters[:termCSV] =  Base64.encode64(Array.wrap(keywords).join(', ')).strip.gsub(/\n/, '')
        end
        SpyFu::Request.new('/apis/core_api/get_term_metrics_bulk_uk', %i(termCSV), parameters).send_request
      end

      def self.get_domain_metrics_us(parameters)
        SpyFu::Request.new('/apis/core_api/get_domain_metrics_us', %i(domain), parameters).send_request
      end

      def self.get_domain_metrics_uk(parameters)
        SpyFu::Request.new('/apis/core_api/get_domain_metrics_uk', %i(domain), parameters).send_request
      end

      def self.get_domain_budget_history_us(parameters)
        SpyFu::Request.new('/apis/core_api/get_domain_budget_history_us', %i(domain), parameters).send_request
      end

      def self.get_domain_budget_history_uk(parameters)
        SpyFu::Request.new('/apis/core_api/get_domain_budget_history_uk', %i(domain), parameters).send_request
      end
    end
  end
end

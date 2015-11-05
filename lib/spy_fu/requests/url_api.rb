module SpyFu
  module Requests
    class UrlApi
      # SpyFu requires the q and r params
      # The q is for query. This is the main input to the API.
      # You give a url or domain and we give back a list of keywords.
      # The r is for max number of results. Paging is not implemented.
      # So if you make a request where r = 100 and get 100 results
      # then you must query again with r = 1000
      # or the like to attempt to get all rows if that's what you're all about.

      # r maps to an Int32, so Int32. MaxValue is the highest value you can enter, technically.
      # But you are charged by the row returned and r impacts performance so it is not recommended that you do this.
      # Request Agnostic Parameters
      #   bcpc - broad cost per click
      #   pcpc - phrase cost per click
      #   ecpc - exact cost per click
      #   Cost per click comes from Google's estimated cost per click
      #     if you were to advertise on this term in Google Adwords.
      #
      #   mc - monthly clicks
      #
      #   The estimated number of clicks that a domain gets on a specific ranking.
      #   We take search volume and position into account to estimate organic clicks.
      #
      #   sd - seo difficulty
      #
      #   A measure of how hard a keyword is to rank on.
      #   We take into account all the domains we're currently finding and how hard each of them is to rank above.

      def self.organic_kws(parameters)
        SpyFu::Request.new('/apis/url_api/organic_kws', %i(q r), parameters).send_request
      end

      # organic_kws Specific Parameters
      #   blmsv - broad local monthly search volume
      #   bgmsv - broad global monthly search volume
      #   plmsv - phrase local monthly search volume
      #   pgmsv - phrase global monthly search volume
      #   elmsv - exact local monthly search volume
      #   egmsv - exact global monthly search volume
      #   Monthly search volume is the average number of searches that a term gets in a month.
      #     Note: paid_kws has very similar filters but they are for daily search volume, not monthly.

      def self.paid_kws(parameters)
        SpyFu::Request.new('/apis/url_api/paid_kws', %i(q r), parameters).send_request
      end

      # paid_kws Specific Parameters
      #   bldsv - broad local daily search volume
      #   bgdsv - broad global daily search volume
      #   pldsv - phrase local daily search volume
      #   pgdsv - phrase global daily search volume
      #   eldsv - exact local daily search volume
      #   egdsv - exact global daily search volume
      #   Daily search volume is the average number of searches that a term gets in a day.
      #   Note: organic_kws has very similar filters but they are for monthly search volume, not daily.
      #
      #   bclpd - broad clicks per day
      #   pclpd - phrase clicks per day
      #   eclpd - exact clicks per day
      #   The estimated clicks per day that a keyword gets.
      #
      #   bcopd - broad cost per day
      #   pcopd - phrase cost per day
      #   ecopd - exact cost per day
      #   The estimated cost per day to bid on a given keyword.
    end
  end
end

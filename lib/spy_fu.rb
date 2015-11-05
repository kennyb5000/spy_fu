require 'httparty'
require 'active_support/all'

module SpyFu
  class Configuration
    attr_accessor :secret_key, :user_id, :base_url
    def initialize
      self.secret_key = nil
      self.user_id = nil
      self.base_url = 'http://www.spyfu.com'
    end
  end

  def self.configuration
    @configuration ||=  Configuration.new
  end

  def self.configure
    yield(configuration) if block_given?
  end

  def self.core_api
    SpyFu::Requests::CoreApi
  end

  def self.kss_api
    SpyFu::Requests::KssApi
  end

  def self.leads_api
    SpyFu::Requests::LeadsApi
  end

  def self.tracking_api
    SpyFu::Requests::TrackingApi
  end

  def self.url_api
    SpyFu::Requests::UrlApi
  end
end

require 'spy_fu/version'
require 'spy_fu/build_message'
require 'spy_fu/build_request'
require 'spy_fu/build_signature'
require 'spy_fu/errors'
require 'spy_fu/request'
require 'spy_fu/response'
require 'spy_fu/requests/url_api'
require 'spy_fu/requests/tracking_api'
require 'spy_fu/requests/leads_api'
require 'spy_fu/requests/kss_api'
require 'spy_fu/requests/core_api'

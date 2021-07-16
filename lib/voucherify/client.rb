require 'uri'
require 'rest-client'
require 'json'

module Voucherify

  class Client
    attr_reader :backend_url

    def initialize (options)
      @options = options
      @backend_url = (@options[:apiUrl] || @options['apiUrl'] || 'https://api.voucherify.io') + '/v1'
      @headers = {
          'X-App-Id' => @options[:applicationId] || @options['applicationId'],
          'X-App-Token' => @options[:clientSecretKey] || @options['clientSecretKey'],
          'X-Voucherify-Channel' => 'Ruby-SDK',
          'X-Voucherify-API-Version' => @options[:apiVersion] || @options['apiVersion'] || 'v2018-08-01',
          :accept => :json,
      }.reject{ |k,v| v.nil? }
      @timeout = @options[:timeout] || @options['timeout']
    end

    def async_actions
      Voucherify::Service::AsyncActions.new(self)
    end

    def vouchers
      Voucherify::Service::Vouchers.new(self)
    end

    def distributions
      Voucherify::Service::Distributions.new(self)
    end

    def validations
      Voucherify::Service::Validations.new(self)
    end

    def redemptions
      Voucherify::Service::Redemptions.new(self)
    end

    def customers
      Voucherify::Service::Customers.new(self)
    end

    def products
      Voucherify::Service::Products.new(self)
    end

    def campaigns
      Voucherify::Service::Campaigns.new(self)
    end

    def validation_rules
      Voucherify::Service::ValidationRules.new(self)
    end

    def segments
      Voucherify::Service::Segments.new(self)
    end

    def events
      Voucherify::Service::Events.new(self)
    end

    def promotions
      Voucherify::Service::Promotions.new(self)
    end

    def orders
      Voucherify::Service::Orders.new(self)
    end

    def rewards
      Voucherify::Service::Rewards.new(self)
    end

    def loyalties
      Voucherify::Service::Loyalties.new(self)
    end

    def consents
        Voucherify::Service::Consents.new(self)
      end

    def get(path, params = {})
      begin
        url = @backend_url + path
        response = RestClient::Request::execute(method: :get, url: url, headers: @headers.merge({:params => params}), read_timeout: @timeout, open_timeout: @timeout)
        JSON.parse(response.body)
      rescue RestClient::Exception => e
        raise VoucherifyError.new(e)
      end
    end

    def put(path, body, params = {})
      begin
        url = @backend_url + path
        response = RestClient::Request::execute(method: :put, url: url, payload: body, headers: @headers.merge({:params => params, :content_type => :json}), read_timeout: @timeout, open_timeout: @timeout)
        JSON.parse(response.body)
      rescue RestClient::Exception => e
        raise VoucherifyError.new(e)
      end
    end

    def post(path, body, params = {})
      begin
        url = @backend_url + path
        response = RestClient::Request::execute(method: :post, url: url, payload: body, headers: @headers.merge({:params => params, :content_type => :json}), read_timeout: @timeout, open_timeout: @timeout)
        if !response.body.empty?
          JSON.parse(response.body)
        else
          nil
        end
      rescue RestClient::Exception => e
        raise VoucherifyError.new(e)
      end
    end

    def delete(path, params = {})
      begin
        url = @backend_url + path
        RestClient::Request::execute(method: :delete, url: url, headers: @headers.merge({:params => params}), read_timeout: @timeout, open_timeout: @timeout)
        nil
      rescue RestClient::Exception => e
        raise VoucherifyError.new(e)
      end
    end
  end

  class VoucherifyError < RuntimeError
    attr_reader :response
    attr_reader :code
    attr_reader :details
    attr_reader :key

    def initialize (restClientError)
      if restClientError.is_a? RestClient::Exceptions::Timeout
        @response = restClientError
        @details = restClientError
        super(restClientError)
      else
      @response = restClientError.response
      parsedResponse = JSON.parse(@response)
      @code = parsedResponse['code']
      @details = parsedResponse['details']
      @key = parsedResponse['key']
      super(parsedResponse['message'])
    end
  end
  end

end

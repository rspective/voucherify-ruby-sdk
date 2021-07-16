require 'uri'

module Voucherify
  module Service
    class AsyncActions
      attr_reader :client

      def initialize(client)
        @client = client
      end

      def get(id)
        @client.get("/async-actions/#{ERB::Util.url_encode(id)}")
      end

      def list(query)
        @client.get('/async-actions', query)
      end

    end
  end
end
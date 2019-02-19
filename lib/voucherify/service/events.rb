module Voucherify
  module Service
    class Events
      attr_reader :client

      def initialize(client)
        @client = client
      end

      def track(event, metadata, customer, referral)
        @client.post('/events', {
            :event => event,
            :metadata => metadata,
            :customer => customer,
            :referral => referral
        }.to_json)
      end
    end
  end
end

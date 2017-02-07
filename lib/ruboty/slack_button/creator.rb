module Ruboty
  module SlackButton
    class Creator
      def initialize(message, channel: nil, webhook_url: nil)
        @message = message
        @channel = channel
        @webhook_url = webhook_url
      end

      def create
      end

      def channel
        @channel ||= message.from
      end

      def webhook_url
        @webhook_url ||= ENV['SLACK_BUTTON_WEBHOOK_URL']
      end

      def payload
        button_message.to_json
      end

      def button_message
        @button_message ||= ButtonMessage.new
      end
    end
  end
end

module Ruboty
  module SlackButton
    class Creator
      def initialize(message, username: nil, icon_emoji: nil, channel: nil, webhook_url: nil)
        @message = message
        @username = username
        @icon_emoji = icon_emoji
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
        button_message.merge({
          channel: channel,
          icon_emoji: icon_emoji,
          username: username,
        }).to_json
      end

      def button_message
        @button_message ||= ButtonMessage.new
      end
    end
  end
end

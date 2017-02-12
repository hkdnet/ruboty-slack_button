require 'json'
require 'ruboty/slack_button/client'

module Ruboty
  module SlackButton
    class Creator
      attr_reader :message, :username, :icon_emoji, :channel, :webhook_url
      def initialize(message, username: nil, icon_emoji: nil, channel: nil, webhook_url: nil)
        @message = message
        @username = username
        @icon_emoji = icon_emoji
        @channel = channel
        @webhook_url = webhook_url
      end

      def create_button(button_message)
        client.post(payload(button_message), headers)
      end

      def payload(button_message)
        payload_object(button_message).to_json
      end

      def payload_object(button_message)
        button_message.as_json.merge({
          channel: channel,
          icon_emoji: icon_emoji,
          username: username,
        })
      end

      def client
        @client ||= Client.new(webhook_url)
      end

      def headers
        @headers ||= {
          'Content-Type' => 'application/json'
        }
      end

      def channel
        @channel ||= message.from
      end

      def webhook_url
        @webhook_url ||= ENV['SLACK_BUTTON_WEBHOOK_URL']
      end
    end
  end
end

require 'json'
require 'ruboty/slack_button/client'

module Ruboty
  module SlackButton
    class Creator
      attr_accessor :message, :username, :icon_emoji, :channel, :webhook_url
      def initialize(message, username: nil, icon_emoji: nil, channel: nil, webhook_url: nil)
        @message = message
        @username = username
        @icon_emoji = icon_emoji
        @channel = channel
        @webhook_url = webhook_url
      end

      def create_button(button_message)
        obj = button_message.as_json
        obj = add_slack_userinfo(obj)
        client.post(obj.to_json, headers)
      end

      def add_slack_userinfo(button_message_object)
        button_message_object.merge(default_userinfo)
      end

      def default_userinfo
        obj = { channel: channel }
        obj[:icon_emoji] = icon_emoji if icon_emoji
        obj[:username] = username if username
        obj
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

module Ruboty
  module SlackButton
    class Creator
      def initialize(message)
        @message = message
      end

      def create
      end

      def channel
        @channel ||= message.from
      end
    end
  end
end

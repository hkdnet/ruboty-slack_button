module Ruboty
  module SlackButton
  end
end

require "ruboty/slack_button/version"
require 'ruboty/slack_button/creator'

require 'ruboty/slack_button/button_creatable'

module Ruboty
  class Message
    include Ruboty::SlackButton::ButtonCreatable
  end
end

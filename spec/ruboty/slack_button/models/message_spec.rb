require 'spec_helper'

describe Ruboty::SlackButton::Models::Message do
  describe '#as_json' do
    let(:message) { Ruboty::SlackButton::Models::Message.new }
    it { expect(message.as_json).to include :text }
    it { expect(message.as_json).to include :attachments }
  end
end

require 'spec_helper'

describe Ruboty::SlackButton::Models::Message do
  describe '#as_json' do
    let(:message) { Ruboty::SlackButton::Models::Message.new(text: text, attachments: attachments) }
    let(:text) { "text" }
    let(:attachments) { [] }
    it { expect(message.as_json).to include :text }
    it { expect(message.as_json).to include :attachments }
    it { expect(message.as_json[:text]).to be text }
    it { expect(message.as_json[:attachments]).to be attachments }
  end
end

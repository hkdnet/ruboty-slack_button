require 'spec_helper'

describe Ruboty::SlackButton::Creator do
  let(:creator) { Ruboty::SlackButton::Creator.new(message) }
  let(:message) do
    Object.new.tap { |e| allow(e).to receive(:from).and_return(from) }
  end
  let(:from) { "#general" }
  let(:client) { Ruboty::SlackButton::Client.new(url) }
  let(:url) { "http://example.com/" }
  describe '#headers' do
    it 'has Content-Type application/json' do
      expect(creator.headers['Content-Type']).to eq 'application/json'
    end
  end

  describe '#channel' do
    it { expect(creator.channel).to eq '#general' }
  end

  describe '#default_userinfo' do
    subject { creator.default_userinfo }
    context 'with icon_emoji and username' do
      before do
        creator.icon_emoji = ':bow:'
        creator.username = 'username'
      end
      let(:obj) { { base: true } }

      it { expect(subject[:channel]).to eq '#general' }
      it { expect(subject[:icon_emoji]).to eq ':bow:' }
      it { expect(subject[:username]).to eq 'username' }
    end

    context 'w/o icon_emoji or username' do
      let(:obj) { { base: true } }

      it { expect(subject).not_to include :icon_emoji }
      it { expect(subject).not_to include :username }
    end
  end
end

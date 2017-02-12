require 'spec_helper'

describe Ruboty::SlackButton::Client do
  let(:client) { Ruboty::SlackButton::Client.new(url) }
  let(:url) { "http://example.com/" }
  describe '#create_request' do
    subject { client.create_request('body', { 'foo' => 'bar' }) }
    it 'set body' do
      expect(subject.body).to eq 'body'
    end

    it 'set headers' do
      expect(subject['foo']).to eq 'bar'
    end
  end
end

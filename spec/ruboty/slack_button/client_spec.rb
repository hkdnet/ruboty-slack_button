require 'spec_helper'

describe Ruboty::SlackButton::Client do
  let(:client) { Ruboty::SlackButton::Client.new(url) }
  let(:url) { "http://example.com/" }
  describe '#create_request' do
    it 'set body' do
      req = client.create_request('body', {})
      expect(req.body).to eq 'body'
    end

    it 'set headers' do
      req = client.create_request('body', { 'foo' => 'bar' })
      expect(req['foo']).to eq 'bar'
    end
  end
end

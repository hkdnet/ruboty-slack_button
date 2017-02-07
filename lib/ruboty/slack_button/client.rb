require 'net/https'

module Ruboty::SlackButton
  class Client
    attr_reader :url
    def initialize(url)
      @url = url
    end

    def post(body, header)
      uri = URI.parse(url)
      http = Net::HTTP.new(uri.host, uri.port)
      if uri.scheme == 'https'
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      end

      req = Net::HTTP::Post.new(uri.path)
      header.each { |(k, v)| req[k] = v }
      req.body = body

      http.request(req)
    end
  end
end

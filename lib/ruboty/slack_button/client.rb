require 'net/https'

module Ruboty::SlackButton
  class Client
    attr_reader :url
    def initialize(url)
      @url = url
    end

    def post(body, header)
      req = create_request(body, header)
      http.request(req)
    end

    def uri
      @uri ||= URI.parse(url)
    end

    def http
      @http ||=
        begin
          http = Net::HTTP.new(uri.host, uri.port)
          if uri.scheme == 'https'
            http.use_ssl = true
            http.verify_mode = OpenSSL::SSL::VERIFY_NONE
          end
          http
        end
    end

    def create_request(body, header)
      req = Net::HTTP::Post.new(uri.path)
      header.each { |(k, v)| req[k] = v }
      req.body = body
      req
    end
  end
end

require 'faraday'
require 'faraday_middleware'

module Sightengine
  module Connection
    def connection
      Faraday::Connection.new({
        headers: {'Content-Type' => 'application/json'}
      }) do |conn|
        conn.use Faraday::Request::UrlEncoded
        conn.use FaradayMiddleware::ParseJson
        conn.adapter(Faraday.default_adapter)
      end
    end
  end
end
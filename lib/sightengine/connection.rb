require 'faraday'

module Sightengine
  module Connection
    def connection
      Faraday::Connection.new({
        headers: {'Content-Type' => 'application/json'}
      }) do |conn|
        conn.use Faraday::Request::UrlEncoded
        conn.adapter(Faraday.default_adapter)
        conn.response :json
      end
    end
  end
end

require "sightengine/api/response"
require "sightengine/api/nudity"

module Sightengine
  class Client
    include Sightengine::Connection
    include Sightengine::Api::Nudity

    BASE_URI = 'https://api.sightengine.com'.freeze

    VALID_OPTIONS = [
      :api_user,
      :api_secret,
      :api_version
    ].freeze

    attr_accessor *VALID_OPTIONS

    def initialize(**options)
      options.merge(default_options).each do |opt, value|
        send("#{opt}=", value)
      end
    end

    def build_uri(path, **params)
      "#{BASE_URI}/#{self.api_version}/#{path}"
    end

    def default_params
      { api_user: self.api_user, api_secret: self.api_secret }
    end

    def default_options
      { api_version: '1.0' }
    end
  end
end